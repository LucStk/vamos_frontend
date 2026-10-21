part of "map_objects.dart";

final class MapTripOrigin extends MapObject implements Selectable {
  const MapTripOrigin();

  @override
  bool get isDraggable => true;

  @override
  int get hitPriority => 200;

  @override
  bool operator ==(Object other) => other is MapLocalization;
  @override
  int get hashCode => (MapLocalization).hashCode;
}
