part of 'scene_item.dart';

abstract class LineItem extends SceneItem {
  List<WorldSegment> get worldSegments;
  Rect get bounds;
  @override
  Length get hitRadius;

  // LineItem({required this.worldSegments, required super.hitRadius})
  //   : bounds = computeBounds(
  //       worldSegments.expand((segment) => [segment.$1.value, segment.$2.value]),
  //     );
  //
  @override
  bool isHitAt(WorldOffset p, double zoomScale) {
    final r = hitRadius.toWorld(zoomScale);
    if (!bounds.inflate(r).contains(p.value)) return false;
    return distanceToPolyline(p.value, worldSegments) <= r;
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
