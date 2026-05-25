// features/map/presentation/providers/map_state_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/features/trips/trips.dart';
import 'package:vamos_cartographie/features/waypoints/waypoints.dart';

enum MapMode { observer, editRoute, addPoint }

class MapState {
  final MapMode mode;
  final bool isDirty;
  final List<Waypoint>? routeSnapshot;
  final List<Segment>? segmentsSnapshot;
  final int waypointsCountBeforeAdd;

  const MapState({
    this.mode = MapMode.observer,
    this.isDirty = false,
    this.routeSnapshot,
    this.segmentsSnapshot,
    this.waypointsCountBeforeAdd = 0,
  });

  MapState copyWith({
    MapMode? mode,
    bool? isDirty,
    List<Waypoint>? routeSnapshot,
    List<Segment>? segmentsSnapshot,
    int? waypointsCountBeforeAdd,
  }) {
    return MapState(
      mode: mode ?? this.mode,
      isDirty: isDirty ?? this.isDirty,
      routeSnapshot: routeSnapshot ?? this.routeSnapshot,
      segmentsSnapshot: segmentsSnapshot ?? this.segmentsSnapshot,
      waypointsCountBeforeAdd:
          waypointsCountBeforeAdd ?? this.waypointsCountBeforeAdd,
    );
  }
}

class MapStateNotifier extends Notifier<MapState> {
  @override
  MapState build() => const MapState();

  void setDirty(bool dirty) => state = state.copyWith(isDirty: dirty);

  void enterEditRoute(Trip trip) {
    // Clone profond pour isoler les objets de l'UI pendant l'édition
    final routeSnap = trip.waypoints
        .map(
          (w) => Waypoint(
            id: w.id,
            latLng: LatLng(w.latLng.latitude, w.latLng.longitude),
            type: w.type,
            description: w.description,
            images: List<TripImage>.from(w.images ?? []),
          ),
        )
        .toList();

    final segmentsSnap = trip.segments
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

final mapStateProvider = NotifierProvider<MapStateNotifier, MapState>(
  MapStateNotifier.new,
);
