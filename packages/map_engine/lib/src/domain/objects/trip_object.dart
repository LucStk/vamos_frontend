part of "map_objects.dart";

class MapTrip extends MapObject implements Selectable {
  final TripId id;
  const MapTrip(this.id);

  @override
  bool get isDraggable => false;

  @override
  int get hitPriority => 100;

  @override
  bool operator ==(Object other) => other is MapTrip && other.id == id;

  @override
  int get hashCode => id.hashCode;
}
