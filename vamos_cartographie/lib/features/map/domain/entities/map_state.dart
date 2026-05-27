// features/map/presentation/providers/map_state_provider.dart
import 'package:vamos_cartographie/features/trips/trips.dart';
import 'package:vamos_cartographie/features/waypoints/waypoints.dart';

enum MapMode { observer, editRoute, addPoint }

class MapState {
  final MapMode mode;
  final bool isDirty;
  final Trip? currentTrip;
  final List<Waypoint>? routeSnapshot;
  final List<Segment>? segmentsSnapshot;
  final int waypointsCountBeforeAdd;

  const MapState({
    this.mode = MapMode.observer,
    this.currentTrip,
    this.isDirty = false,
    this.routeSnapshot,
    this.segmentsSnapshot,
    this.waypointsCountBeforeAdd = 0,
  });

  MapState copyWith({
    MapMode? mode,
    bool? isDirty,
    Trip? currentTrip,
    List<Waypoint>? routeSnapshot,
    List<Segment>? segmentsSnapshot,
    int? waypointsCountBeforeAdd,
  }) {
    return MapState(
      currentTrip: currentTrip ?? this.currentTrip,
      mode: mode ?? this.mode,
      isDirty: isDirty ?? this.isDirty,
      routeSnapshot: routeSnapshot ?? this.routeSnapshot,
      segmentsSnapshot: segmentsSnapshot ?? this.segmentsSnapshot,
      waypointsCountBeforeAdd:
          waypointsCountBeforeAdd ?? this.waypointsCountBeforeAdd,
    );
  }
}
