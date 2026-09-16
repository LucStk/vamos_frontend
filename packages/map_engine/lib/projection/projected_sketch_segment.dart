part of 'projected_object.dart';

final class ProjectedSketchSegment extends ProjectedLine<MapSketchSegment> {
  ProjectedSketchSegment({required super.object, required super.camera});

  @override
  List<MapDrawCommand> describe({
    MapPaintContext context = const MapPaintContext(),
  }) {
    final path = this.path;
    if (path == null) return [];
    return [
      DrawPath(
        path: path,
        paint: Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 5
          ..strokeCap = StrokeCap.round
          ..strokeJoin = StrokeJoin.round,
      ),
    ];
  }
}
