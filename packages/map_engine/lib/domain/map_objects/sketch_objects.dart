part of 'map_objects.dart';

final class MapSketchSegment extends MapLine {
  const MapSketchSegment(super.geometry);

  @override
  double get radius => 10;

  @override
  int get hitPriority => 50;

  @override
  bool isSameAs(MapObject other) => other is MapSketchSegment;
}

final class MapSketchPencil extends MapPoint {
  const MapSketchPencil(super.position);

  @override
  double get radius => 10;

  @override
  bool get isDraggable => true;

  @override
  int get hitPriority => 200;

  @override
  bool isSameAs(MapObject other) => other is MapSketchPencil;
}
