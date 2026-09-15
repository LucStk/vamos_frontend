part of 'projected_object.dart';

abstract class ProjectedLine<T extends MapLine> extends ProjectedObject {
  final List<Offset> projectedPoints;
  final Rect bounds;

  ProjectedLine({required T object, required MapCameraReader camera})
    : projectedPoints = object.geometry
          .map(camera.latLngToScreenOffset)
          .toList(),
      bounds = computeBounds(object.geometry.map(camera.latLngToScreenOffset)),
      super(object);

  T get line => object as T;

  @override
  bool isHitAt(Offset position) {
    if (!bounds.inflate(line.radius).contains(position)) {
      return false;
    }

    return distanceToPolyline(position, projectedPoints) <= line.radius;
  }

  void paintPath(Canvas canvas, Paint paint) {
    if (projectedPoints.length < 2) return;

    final path = Path()
      ..moveTo(projectedPoints.first.dx, projectedPoints.first.dy);

    for (final point in projectedPoints.skip(1)) {
      path.lineTo(point.dx, point.dy);
    }

    canvas.drawPath(path, paint);
  }
}
