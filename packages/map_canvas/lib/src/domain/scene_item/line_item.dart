part of 'scene_item.dart';

abstract class LineItem extends SceneItem {
  List<WorldSegment> get worldSegments;

  /// Calculé au premier accès puis mis en cache. Valide tant que
  /// `worldSegments` ne change pas (c'est un `final` dans les items).
  late final Rect bounds = computeBounds(
    worldSegments.expand((s) => [s.$1.value, s.$2.value]),
  );

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
