part of 'map_objects.dart';

final class MapUserLocation extends MapPoint {
  final double accuracy;
  final double heading;
  const MapUserLocation(
    super.position, {
    required this.accuracy,
    required this.heading,
  });

  @override
  double get radius => 10;

  @override
  bool get isDraggable => true;

  @override
  int get hitPriority => 200;

  @override
  bool isSameAs(MapObject other) => other is MapSketchPencil;
}
