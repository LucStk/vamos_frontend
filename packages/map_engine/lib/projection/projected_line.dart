part of 'projected_object.dart';

abstract class ProjectedLine<T extends MapLine> extends ProjectedObject {
  final List<Offset> projectedPoints;
  final Rect bounds;

  ProjectedLine({required T object, required this.projectedPoints})
    : bounds = computeBounds(projectedPoints),
      super(object);

  T get line => object as T;

  @override
  bool isHitAt(Offset position, double scale) {
    if (!bounds.inflate(line.radius).contains(position)) {
      return false;
    }

    return distanceToPolyline(position, projectedPoints) <=
        (line.radius / scale);
  }

  Path? get path {
    if (projectedPoints.length < 2) return null;

    final path = Path()
      ..moveTo(projectedPoints.first.dx, projectedPoints.first.dy);

    for (final point in projectedPoints.skip(1)) {
      path.lineTo(point.dx, point.dy);
    }
    return path;
  }
}
