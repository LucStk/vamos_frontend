part of 'map_objects.dart';

final class MapWaypoint extends MapObject implements Selectable {
  final WaypointId id;
  final TripId tripId;
  const MapWaypoint({required this.id, required this.tripId});

  @override
  bool get isDraggable => true;

  @override
  bool operator ==(Object other) => other is MapWaypoint && other.id == id;

  @override
  int get hashCode => id.hashCode;
}

final class MapPendingWaypoint extends MapObject implements Selectable {
  final TripId tripId;
  const MapPendingWaypoint({required this.tripId});

  @override
  bool get isDraggable => true;

  @override
  bool operator ==(Object other) => other is MapPendingWaypoint;

  @override
  int get hashCode => (MapPendingWaypoint).hashCode;
}
