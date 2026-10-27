part of "map_objects.dart";

final class MapTripEnd extends MapObject implements Selectable {
  final TripId tripId;
  const MapTripEnd(this.tripId);

  @override
  bool get isDraggable => true;

  @override
  int get hitPriority => 200;

  @override
  bool operator ==(Object other) => other is MapLocalization;
  @override
  int get hashCode => (MapLocalization).hashCode;
}
