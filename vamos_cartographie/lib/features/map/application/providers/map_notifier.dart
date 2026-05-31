// features/map/presentation/providers/map_state_provider.dart
import 'package:get_it/get_it.dart';
import 'package:vamos_cartographie/core/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/features/trips/trips.dart';
import "package:vamos_cartographie/features/waypoints/waypoints.dart";
import 'package:riverpod_annotation/riverpod_annotation.dart';
import "package:vamos_cartographie/features/map/application/states/states.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
part 'map_notifier.g.dart';

final getIt = GetIt.instance;
@riverpod
IWaypointRepository _waypointRepository(Ref ref) {
  return getIt<IWaypointRepository>();
}

// Permet d'accéder au trip actuel sans prop drilling le tripId
final currentTripIdProvider = Provider<int>((ref) {
  throw UnimplementedError();
});

@riverpod
class MapStateNotifier extends _$MapStateNotifier {
  late final IWaypointRepository repository;
  @override
  MapState build(int tripId) {
    final trip = ref.read(tripProvider(tripId));
    repository = ref.read(_waypointRepositoryProvider);
    if (trip == null) {
      throw Exception('Trip introuvable');
    }
    return MapState.fromTrip(trip);
  }

  void startWaypointCreation(LatLng position) {
    print("startWaypointCreation {$position");
    state = state.copyWith(
      interaction: MapInteraction.creatingWaypoint(position: position),
    );
  }

  void updatePendingWaypointPosition(LatLng position) {
    state.interaction.mapOrNull(
      creatingWaypoint: (interaction) {
        state = state.copyWith(
          interaction: interaction.copyWith(position: position),
        );
      },
    );
  }

  // void confirmPendingWaypoint() {
  //   state.interaction.mapOrNull(
  //     creatingWaypoint: (interaction) {
  //       _addWaypointLocal(WaypointDraft(latLng: interaction.position));

  //       state = state.copyWith(interaction: const MapInteraction.none());
  //     },
  //   );
  // }

  void cancelInteraction() {
    state = state.copyWith(interaction: const MapInteraction.none());
  }

  void _addWaypointLocal(Waypoint waypoint) {
    state = state.copyWith(waypoints: [...state.waypoints, waypoint]);
  }

  void _removeWaypointLocalById(int id) {
    state = state.copyWith(
      waypoints: state.waypoints.where((w) => w.id != id).toList(),
    );
  }

  void _updateWaypointLocal(Waypoint waypoint) {
    bool wFind = false;
    state = state.copyWith(
      waypoints: state.waypoints.map((w) {
        if (w.id == waypoint.id) {
          wFind = true;
          return waypoint;
        }
        return w;
      }).toList(),
    );
    if (!wFind) {
      throw (Exception(
        "Call to UpdateWapointLocal fail : waypoint not in state",
      ));
    }
  }

  Future<void> updateWaypointRemote(int id, WaypointDraft draft) async {
    final previous = state;

    // waypoint optimiste local
    final optimisticWaypoint = draft.toWaypoint(id);
    _updateWaypointLocal(optimisticWaypoint);
    // appel serveur
    final Either<Failure, Waypoint> result = await repository.updateWaypoint(
      id,
      draft,
    );

    result.fold(
      (failure) {
        // rollback
        state = previous;
      },
      (serverWaypoint) {
        // sync avec vérité serveur
        if (optimisticWaypoint != serverWaypoint) {
          _updateWaypointLocal(serverWaypoint);
        }
      },
    );
  }

  Future<void> createWaypointRemote(WaypointDraft waypoint) async {
    // appel serveur
    final Either<Failure, Waypoint> result = await repository.createWaypoint(
      state.tripId,
      waypoint,
    );

    result.fold(
      (failure) {
        // TODO : throw argument ou qq chose comme ça
      },
      (serverWaypoint) {
        // sync avec vérité serveur
        _addWaypointLocal(serverWaypoint);
      },
    );
  }

  Future<void> deleteWaypointRemote(int waypointId) async {
    final Either<Failure, void> result = await repository.deleteWaypoint(
      waypointId,
    );

    result.fold(
      (failure) {
        // TODO : throw argument ou qq chose comme ça
      },
      (_) {
        _removeWaypointLocalById(waypointId);
      },
    );
  }

  void updateWaypointPositionLocal(Waypoint waypoint, LatLng latLng) {
    _updateWaypointLocal(waypoint.copyWith(latLng: latLng));
  }

  Future<void> updateWaypointPosition(Waypoint waypoint, LatLng latLng) async {
    await updateWaypointRemote(
      waypoint.id,
      waypoint.copyWith(latLng: latLng).toDraft(),
    );
  }

  void moveIntermediatePoint(int segmentIndex, int pointIndex, LatLng latLng) {
    final segments = [...state.segments];
    final segment = segments[segmentIndex];
    final points = [...segment.intermediatePoints];

    if (points[pointIndex] == latLng) return;

    points[pointIndex] = latLng;
    segments[segmentIndex] = segment.copyWith(intermediatePoints: points);

    state = state.copyWith(segments: segments);
  }
}

@riverpod
Waypoint? waypoint(Ref ref, int tripId, int waypointId) {
  final mapState = ref.watch(mapStateProvider(tripId));

  return mapState.waypoints.where((w) => w.id == waypointId).firstOrNull;
}
