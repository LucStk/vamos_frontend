// features/map/presentation/providers/map_state_provider.dart
import 'package:vamos_cartographie/features/trips/trips.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import "package:vamos_cartographie/features/map/domain/entities/map_state.dart";
part 'map_notifier.g.dart';

@riverpod
class MapStateNotifier extends _$MapStateNotifier {
  @override
  MapState build(Trip trip) {
    return MapState.fromTrip(trip);
  }

  void markDirty() {
    state = state.copyWith(isDirty: true);
  }

  void resetSnapshots() {
    state = state.copyWith(
      waypointsSnapshot: List.unmodifiable(state.currentTrip.waypoints),
      segmentsSnapshot: List.unmodifiable(state.currentTrip.segments),
      isDirty: false,
    );
  }

  //   void updateTrip(Trip updatedTrip) {
  //     state = state.copyWith(
  //       currentTrip: updatedTrip,
  //       isDirty: true,
  //     );
  //   }
  // void cancelAddPoint(Trip trip) {
  //   final addedCount = trip.waypoints.length - state.waypointsCountBeforeAdd;
  //   for (var i = 0; i < addedCount; i++) {
  //     trip.removeWaypoint(trip.waypoints.length - 1);
  //   }
  //   state = state.copyWith(mode: MapMode.observer, isDirty: false);
  // }

  // void addWaypoint(Trip trip, LatLng latLng) {
  //   Waypoint newWaypoint = Waypoint(latLng: latLng);
  //   List<Waypoint> waypointsDraft = [state.waypointsSnapshot
  //   state = state.copyWith(isDirty: true);
  // }

  // void confirmAddPoint() {
  //   state = state.copyWith(mode: MapMode.observer, isDirty: false);
  // }
}

  // void enterEditRoute() {
  //   // Clone profond pour isoler les objets de l'UI pendant l'édition
  //   final routeSnap = state.currentTrip?.waypoints
  //       .map(
  //         (w) => Waypoint(
  //           id: w.id,
  //           latLng: LatLng(w.latLng.latitude, w.latLng.longitude),
  //           type: w.type,
  //           description: w.description,
  //           images: List<MediaImage>.from(w.images ?? []),
  //         ),
  //       )
  //       .toList();

  //   final segmentsSnap = state.currentTrip?.segments
  //       .map(
  //         (s) => Segment(
  //           id: s.id,
  //           type: s.type,
  //           intermediatePoints: List<LatLng>.from(s.intermediatePoints),
  //         ),
  //       )
  //       .toList();

  //   state = state.copyWith(
  //     mode: MapMode.editRoute,
  //     isDirty: false,
  //     routeSnapshot: routeSnap,
  //     segmentsSnapshot: segmentsSnap,
  //   );
  // }

  // void cancelEditRoute(Trip trip) {
  //   if (state.routeSnapshot != null) {
  //     trip.waypoints
  //       ..clear()
  //       ..addAll(state.routeSnapshot!);
  //     trip.segments
  //       ..clear()
  //       ..addAll(state.segmentsSnapshot!);
  //   }
  //   state = state.copyWith(mode: MapMode.observer, isDirty: false);
  // }
