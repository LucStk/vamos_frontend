part of 'projected_object.dart';

final class ProjectedSegment extends ProjectedLine<MapSegment> {
  ProjectedSegment({required super.object, required super.camera});

  @override
  void paint(
    Canvas canvas, {
    MapPaintContext context = const MapPaintContext(),
  }) {
    paintPath(
      canvas,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 4
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round,
    );
  }
}
