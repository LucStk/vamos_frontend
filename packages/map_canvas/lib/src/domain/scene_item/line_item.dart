part of 'scene_item.dart';

abstract class LineItem<T extends MapLine> extends SceneItem {
  final List<WorldSegment> worldSegments;
  final Rect bounds;

  LineItem({required T object, required this.worldSegments})
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
