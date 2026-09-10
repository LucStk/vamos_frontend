import 'dart:ui';

import 'package:map_application/domain/domain.dart';
import 'package:map_application/map_camera_controller.dart';

class ProjectedLine extends ProjectedObject {
  final List<Offset> projectedPoints;
  final Rect bounds;

  ProjectedLine._({
    required MapLine object,
    required this.projectedPoints,
    required this.bounds,
  }) : super(object);

  factory ProjectedLine({required MapLine object, required Camera camera}) {
    final points = object.geometry.map(camera.latLngToScreenOffset).toList();

    return ProjectedLine._(
      object: object,
      projectedPoints: points,
      bounds: _computeBounds(points),
    );
  }

  static Rect _computeBounds(Iterable<Offset> points) {
    if (points.isEmpty) return Rect.zero;
    var minX = double.infinity, minY = double.infinity;
    var maxX = -double.infinity, maxY = -double.infinity;

    for (final p in points) {
      if (p.dx < minX) minX = p.dx;
      if (p.dx > maxX) maxX = p.dx;
      if (p.dy < minY) minY = p.dy;
      if (p.dy > maxY) maxY = p.dy;
    }
    return Rect.fromLTRB(minX, minY, maxX, maxY);
  }

  @override
  bool isHitAt(Offset point) {
    // 1. AABB Test : Si le point n'est pas dans la Bounding Box + marge, KO immédiat
    if (!bounds.inflate(object.radius).contains(point)) {
      return false;
    }

    // 2. Early Exit + Squared Distance sur les segments
    final radiusSq = object.radius * object.radius;
    for (var i = 0; i < projectedPoints.length - 1; i++) {
      if (_distanceSquaredToSegment(
            projectedPoints[i],
            projectedPoints[i + 1],
            point,
          ) <=
          radiusSq) {
        return true; // Touché ! Inutile de tester les segments suivants.
      }
    }
    return false;
  }

  static double _distanceSquaredToSegment(Offset a, Offset b, Offset p) {
    final ab = b - a;
    final ap = p - a;
    final abSquare = ab.distanceSquared;

    if (abSquare == 0) return ap.distanceSquared;

    final t = ((ap.dx * ab.dx + ap.dy * ab.dy) / abSquare).clamp(0.0, 1.0);
    final projection = a + (ab * t);

    return (p - projection).distanceSquared;
  }
}
