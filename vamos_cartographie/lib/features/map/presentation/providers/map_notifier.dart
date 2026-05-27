// features/map/presentation/providers/map_state_provider.dart
import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/features/trips/trips.dart';
import 'package:vamos_cartographie/features/waypoints/waypoints.dart';
import "package:vamos_cartographie/features/media/media.dart";

import 'package:riverpod_annotation/riverpod_annotation.dart';
import "package:vamos_cartographie/features/map/domain/entities/map_state.dart";
part 'map_notifier.g.dart';

@riverpod
class MapStateNotifier extends _$MapStateNotifier {
  @override
  MapState build(int tripId) {
    return const MapState();
  }

  void initialize(Trip trip) {
    if (state.currentTrip != null) return;
    state = MapState(currentTrip: trip);
  }

  void setDirty(bool dirty) => state = state.copyWith(isDirty: dirty);

  void enterEditRoute() {
    // Clone profond pour isoler les objets de l'UI pendant l'édition
    final routeSnap = state.currentTrip?.waypoints
        .map(
          (w) => Waypoint(
            id: w.id,
            latLng: LatLng(w.latLng.latitude, w.latLng.longitude),
            type: w.type,
            description: w.description,
            images: List<MediaImage>.from(w.images ?? []),
          ),
        )
        .toList();

    final segmentsSnap = state.currentTrip?.segments
        .map(
          (s) => Segment(
            id: s.id,
            type: s.type,
            intermediatePoints: List<LatLng>.from(s.intermediatePoints),
          ),
        )
        .toList();

    state = state.copyWith(
      mode: MapMode.editRoute,
      isDirty: false,
      routeSnapshot: routeSnap,
      segmentsSnapshot: segmentsSnap,
    );
  }

  void cancelEditRoute(Trip trip) {
    if (state.routeSnapshot != null) {
      trip.waypoints
        ..clear()
        ..addAll(state.routeSnapshot!);
      trip.segments
        ..clear()
        ..addAll(state.segmentsSnapshot!);
    }
    state = state.copyWith(mode: MapMode.observer, isDirty: false);
  }

  void enterAddPoint(Trip trip) {
    state = state.copyWith(
      mode: MapMode.addPoint,
      isDirty: false,
      waypointsCountBeforeAdd: trip.waypoints.length,
    );
  }

  void cancelAddPoint(Trip trip) {
    final addedCount = trip.waypoints.length - state.waypointsCountBeforeAdd;
    for (var i = 0; i < addedCount; i++) {
      trip.removeWaypoint(trip.waypoints.length - 1);
    }
    state = state.copyWith(mode: MapMode.observer, isDirty: false);
  }

  void addWaypoint(Trip trip, LatLng latLng) {
    trip.addWaypoint(latLng);
    state = state.copyWith(isDirty: true);
  }

  void confirmAddPoint() {
    state = state.copyWith(mode: MapMode.observer, isDirty: false);
  }
}
