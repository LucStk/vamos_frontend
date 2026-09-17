part of 'projected_object.dart';

final class ProjectedUserLocation extends ProjectedPoint<MapUserLocation> {
  ProjectedUserLocation({required super.object, required super.worldPosition});

  @override
  List<MapDrawCommand> describe({
    MapPaintContext context = const MapPaintContext(),
  }) {
    // final accuracyPaint = Paint()..style = PaintingStyle.fill;
    // canvas.drawCircle(projectedPosition, point.accuracy, accuracyPaint);
    final positionPaint = Paint()..style = PaintingStyle.fill;
    return [DrawCircle(center: worldPosition, radius: 8, paint: positionPaint)];
  }
}
