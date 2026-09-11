part of 'projected_object.dart';

final class ProjectedUserLocation extends ProjectedPoint<MapUserLocation> {
  ProjectedUserLocation({required super.object, required super.camera});

  @override
  void paint(
    Canvas canvas, {
    MapPaintContext context = const MapPaintContext(),
  }) {
    final accuracyPaint = Paint()..style = PaintingStyle.fill;
    canvas.drawCircle(projectedPosition, point.accuracy, accuracyPaint);
    final positionPaint = Paint()..style = PaintingStyle.fill;
    canvas.drawCircle(projectedPosition, 8, positionPaint);
  }
}
