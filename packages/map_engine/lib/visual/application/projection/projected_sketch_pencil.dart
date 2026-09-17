part of 'projected_object.dart';

final class ProjectedSketchPencil extends ProjectedPoint<MapSketchPencil> {
  ProjectedSketchPencil({required super.object, required super.worldPosition});

  @override
  List<MapDrawCommand> describe({
    MapPaintContext context = const MapPaintContext(),
  }) {
    final paint = Paint()..style = PaintingStyle.fill;

    return [DrawCircle(center: worldPosition, radius: 8, paint: paint)];
  }
}
