part of 'scene_item.dart';

abstract class PolylineItem extends SceneItem {
  List<List<WorldSegment>> get worldSegments;
  Rect get bounds;

  // PolylineItem({
  //   required T object,
  //   required this.worldSegments,
  //   required super.hitRadius,
  // }) : bounds = computeBounds(
  //        worldSegments.expand(
  //          (line) =>
  //              line.expand((segment) => [segment.$1.value, segment.$2.value]),
  //        ),
  //      ),
  //      super(object);

  @override
  bool isHitAt(WorldOffset p, double zoomScale) {
    final r = hitRadius.toWorld(zoomScale);
    if (!bounds.inflate(r).contains(p.value)) return false;
    return worldSegments.any((s) => distanceToPolyline(p.value, s) <= r);
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
