part of 'projected_object.dart';

final class ProjectedSketchPencil extends ProjectedPoint<MapSketchPencil> {
  ProjectedSketchPencil({required super.object, required super.camera});

  @override
  void paint(
    Canvas canvas, {
    MapPaintContext context = const MapPaintContext(),
  }) {
    final paint = Paint()..style = PaintingStyle.fill;

    canvas.drawCircle(projectedPosition, 8, paint);
  }
}
