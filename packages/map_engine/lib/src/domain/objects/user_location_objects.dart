part of 'map_objects.dart';

final class MapUserLocation extends MapObject implements Selectable {
  final double accuracy;
  final double heading;
  const MapUserLocation({required this.accuracy, required this.heading});

  @override
  bool get isDraggable => true;

  @override
  int get hitPriority => 200;

  @override
  bool operator ==(Object other) => other is MapUserLocation;
  @override
  int get hashCode => (MapUserLocation).hashCode;
}
