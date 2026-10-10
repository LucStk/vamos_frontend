part of "map_objects.dart";

class MapTripObject extends MapSegmentedLine {
  final TripId id;
  const MapTripObject(this.id, super.lines);

  @override
  Object get stableId => ("trip", id);

  @override
  double get radius => 24;

  @override
  bool get isDraggable => false;

  @override
  int get hitPriority => 100;

  @override
  bool isSameAs(MapObject? other) => other is MapTripObject && other.id == id;
}
