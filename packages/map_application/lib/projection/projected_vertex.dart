part of 'projected_object.dart';

final class ProjectedVertex extends ProjectedPoint<MapVertex> {
  ProjectedVertex({required super.object, required super.camera});

  @override
  void paint(
    Canvas canvas, {
    MapPaintContext context = const MapPaintContext(),
  }) {
    switch (point){
      case
    }
    switch (context.state) {
      case MapObjectVisualState.selected:
        final selectionPaint = Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 3;

        canvas.drawCircle(projectedPosition, 14, selectionPaint);
      case _:
        final paint = Paint()..style = PaintingStyle.fill;

        canvas.drawCircle(projectedPosition, 8, paint);
    }
  }
}
