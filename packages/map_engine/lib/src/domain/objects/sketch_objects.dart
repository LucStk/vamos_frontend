part of 'map_objects.dart';

final class MapSketchSegment extends MapObject {
  const MapSketchSegment();

  @override
  int get hitPriority => 50;
  @override
  bool get isDropTarget => false;

  @override
  bool operator ==(Object other) => other is MapSketchSegment;

  @override
  int get hashCode => (MapSketchSegment).hashCode;
}

final class MapSketchPencil extends MapObject {
  const MapSketchPencil();

  @override
  bool get isDraggable => true;

  @override
  bool get isDropTarget => false;

  @override
  int get hitPriority => 200;

  @override
  bool operator ==(Object other) => other is MapSketchPencil;
  @override
  int get hashCode => (MapSketchPencil).hashCode;
}
