part of "map_objects.dart";

final class MapTripEnd extends MapObject implements Selectable {
  const MapTripEnd();

  @override
  bool get isDraggable => true;

  @override
  int get hitPriority => 200;

  @override
  bool operator ==(Object other) => other is MapLocalization;
  @override
  int get hashCode => (MapLocalization).hashCode;
}
