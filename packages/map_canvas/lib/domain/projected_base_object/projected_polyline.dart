part of 'projected_object.dart';

abstract class ProjectedPolyline<T extends MapPolyline>
    extends ProjectedObject {
  final List<List<WorldSegment>> worldSegments;
  final Rect bounds;

  ProjectedPolyline({required T object, required this.worldSegments})
    : bounds = computeBounds(
        worldSegments.expand(
          (line) =>
              line.expand((segment) => [segment.$1.value, segment.$2.value]),
        ),
      ),
      super(object);

  T get line => object as T;

  @override
  bool isHitAt(WorldOffset position, double scale) {
    if (!bounds.inflate(line.radius).contains(position.value)) {
      return false;
    }

    for (final segments in worldSegments) {
      if (distanceToPolyline(position.value, segments) <= line.radius / scale) {
        return true;
      }
    }

    return false;
  }

  Path get path {
    final path = Path();

    for (final segments in worldSegments) {
      if (segments.isEmpty) continue;

      final first = segments.first.$1;
      path.moveTo(first.dx, first.dy);

      for (final (_, end) in segments) {
        path.lineTo(end.dx, end.dy);
      }
    }

    return path;
  }
}
