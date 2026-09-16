part of 'projected_object.dart';

final class ProjectedSegment extends ProjectedLine<MapSegment> {
  ProjectedSegment({required super.object, required super.camera});

  @override
  List<MapDrawCommand> describe({
    MapPaintContext context = const MapPaintContext(),
  }) {
    final path = this.path;
    if (path == null) {
      return const [];
    }
    switch (context.state) {
      case MapObjectVisualState.selected:
        return [
          DrawPath(
            path: path,
            paint: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 7
              ..strokeCap = StrokeCap.round
              ..strokeJoin = StrokeJoin.round,
          ),
        ];
      case _:
        return [
          DrawPath(
            paint: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 5
              ..strokeCap = StrokeCap.round
              ..strokeJoin = StrokeJoin.round,
            path: path,
          ),
        ];
    }
  }
}
