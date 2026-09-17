part of 'projected_object.dart';

abstract class ProjectedLine<T extends MapLine> extends ProjectedObject {
  final List<WorldOffset> worldPoints;
  final Rect bounds;

  ProjectedLine({required T object, required this.worldPoints})
    : bounds = computeBounds(worldPoints.map((m) => m.value)),
      super(object);

  T get line => object as T;

  @override
  bool isHitAt(WorldOffset position, double scale) {
    if (!bounds.inflate(line.radius).contains(position.value)) {
      return false;
    }

    return distanceToPolyline(
          position.value,
          worldPoints.map((m) => m.value).toList(),
        ) <=
        (line.radius / scale);
  }

  Path? get path {
    if (worldPoints.length < 2) return null;

    final path = Path()..moveTo(worldPoints.first.dx, worldPoints.first.dy);

    for (final point in worldPoints.skip(1)) {
      path.lineTo(point.dx, point.dy);
    }
    return path;
  }
}
