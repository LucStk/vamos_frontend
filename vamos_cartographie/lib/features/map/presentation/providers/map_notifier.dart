// features/map/presentation/providers/map_state_provider.dart
import 'package:get_it/get_it.dart';
import 'package:vamos_cartographie/core/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/features/trips/trips.dart';
import "package:vamos_cartographie/features/waypoints/waypoints.dart";
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:vamos_cartographie/features/map/domain/entities/entities.dart";
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

  void setDragging(bool dragging) {
    state.interaction.mapOrNull(
      creatingWaypoint: (interaction) {
        state = state.copyWith(
          interaction: interaction.copyWith(isDragging: dragging),
        );
      },
    );
  }

  void confirmPendingWaypoint() {
    state.interaction.mapOrNull(
      creatingWaypoint: (interaction) {
        addWaypoint(WaypointDraft(latLng: interaction.position));

        state = state.copyWith(interaction: const MapInteraction.none());
      },
    );
  }

  void cancelInteraction() {
    state = state.copyWith(interaction: const MapInteraction.none());
  }

  void addWaypoint(WaypointDraft waypoint) {
    //state = state.copyWith(waypoints: [...state.waypoints, waypoint]);
  }

  void removeWaypointById(int id) {
    state = state.copyWith(
      waypoints: state.waypoints.where((w) => w.id != id).toList(),
    );
  }

  Future<void> updateWaypoint(int id, WaypointDraft draft) async {
    final previous = state;

    // waypoint optimiste local
    final optimisticWaypoint = draft.toWaypoint(id);

    // optimistic update
    state = state.copyWith(
      waypoints: state.waypoints.map((w) {
        if (w.id == id) {
          return optimisticWaypoint;
        }
        return w;
      }).toList(),
    );

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
        state = state.copyWith(
          waypoints: state.waypoints.map((w) {
            if (w.id == id) {
              return serverWaypoint;
            }
            return w;
          }).toList(),
        );
      },
    );
  }

  void updateWaypointPositionLocal(Waypoint waypoint, LatLng latLng) {
    state = state.copyWith(
      waypoints: state.waypoints.map((w) {
        if (w.id == waypoint.id) {
          return w.copyWith(latLng: latLng);
        }
        return w;
      }).toList(),
    );
  }

  Future<void> updateWaypointPosition(Waypoint waypoint, LatLng latLng) async {
    await updateWaypoint(
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

  // void openWaypoint(int id) {
  //   state = state.copyWith(event: MapEvent.openWaypointDialog(waypointId: id));
  // }

  // void openWaypointEditor(int id) {
  //   state = state.copyWith(event: MapEvent.openWaypointEditor(waypointId: id));
  // }

  // void clearEvent() {
  //   state = state.copyWith(event: null);
  // }
}
