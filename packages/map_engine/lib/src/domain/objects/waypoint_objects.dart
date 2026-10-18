part of 'map_objects.dart';

final class MapWaypoint extends MapObject implements Selectable {
  final WaypointId id;
  final TripId tripId;
  const MapWaypoint({required this.id, required this.tripId});

  @override
  bool get isDraggable => true;

  @override
  int get hitPriority => 100;

  @override
  bool operator ==(Object other) => other is MapWaypoint && other.id == id;

  @override
  int get hashCode => id.hashCode;
}
