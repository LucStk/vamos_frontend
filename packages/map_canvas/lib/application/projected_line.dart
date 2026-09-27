part of 'projected_object.dart';

abstract class ProjectedLine<T extends MapLine> extends ProjectedObject {
  final List<WorldSegment> worldSegments;
  final Rect bounds;

  ProjectedLine({required T object, required this.worldSegments})
    : bounds = computeBounds(
        worldSegments.expand((segment) => [segment.$1.value, segment.$2.value]),
      ),
      super(object);

  T get line => object as T;

  @override
  bool isHitAt(WorldOffset position, double scale) {
    if (!bounds.inflate(line.radius).contains(position.value)) {
      return false;
    }

    return distanceToPolyline(position.value, worldSegments) <=
        (line.radius / scale);
  }

  Path get path {
    final path = Path();
    for (final (start, end) in worldSegments) {
      path
        ..moveTo(start.dx, start.dy)
        ..lineTo(end.dx, end.dy);
    }
    return path;
  }
}
