part of 'map_objects.dart';

final class MapLocalization extends MapObject implements Selectable {
  final double accuracy;
  final double heading;
  const MapLocalization({required this.accuracy, required this.heading});

  @override
  bool get isDraggable => true;

  @override
  int get hitPriority => 200;

  @override
  bool operator ==(Object other) => other is MapLocalization;
  @override
  int get hashCode => (MapLocalization).hashCode;
}
