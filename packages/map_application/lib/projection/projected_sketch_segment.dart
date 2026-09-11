part of 'projected_object.dart';

final class ProjectedSketchSegment extends ProjectedLine<MapSketchSegment> {
  ProjectedSketchSegment({required super.object, required super.camera});

  @override
  void paint(
    Canvas canvas, {
    MapPaintContext context = const MapPaintContext(),
  }) {
    paintPath(
      canvas,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 5
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round,
    );
  }
}
