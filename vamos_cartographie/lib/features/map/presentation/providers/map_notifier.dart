// features/map/presentation/providers/map_state_provider.dart
import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/features/trips/trips.dart';
import "package:vamos_cartographie/features/waypoints/waypoints.dart";
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:vamos_cartographie/features/map/domain/entities/entities.dart";
part 'map_notifier.g.dart';

// Permet d'accéder au trip actuel sans prop drilling le tripId
final currentTripIdProvider = Provider<int>((ref) {
  throw UnimplementedError();
});

@riverpod
class MapStateNotifier extends _$MapStateNotifier {
  @override
  MapState build(int tripId) {
    final trip = ref.read(tripProvider(tripId));

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

  void updateWaypoint(Waypoint updatedWaypoint) {
    state = state.copyWith(
      waypoints: state.waypoints.map((w) {
        if (w.id == updatedWaypoint.id) {
          return updatedWaypoint;
        }
        return w;
      }).toList(),
    );
  }

  void updateWaypointPosition(Waypoint waypoint, LatLng latLng) {
    updateWaypoint(waypoint.copyWith(latLng: latLng));
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

  void openWaypoint(int id) {
    state = state.copyWith(event: MapEvent.openWaypointDialog(waypointId: id));
  }

  void openWaypointEditor(int id) {
    state = state.copyWith(event: MapEvent.openWaypointEditor(waypointId: id));
  }

  void clearEvent() {
    state = state.copyWith(event: null);
  }
}
