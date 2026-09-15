import 'dart:ui';
import 'dart:math' as math;

Rect computeBounds(Iterable<Offset> points) {
  final pointsList = points.toList();

  if (pointsList.isEmpty) {
    return Rect.zero;
  }

  var minX = pointsList.first.dx;
  var maxX = pointsList.first.dx;
  var minY = pointsList.first.dy;
  var maxY = pointsList.first.dy;

  for (final point in pointsList.skip(1)) {
    minX = math.min(minX, point.dx);
    maxX = math.max(maxX, point.dx);
    minY = math.min(minY, point.dy);
    maxY = math.max(maxY, point.dy);
  }

  return Rect.fromLTRB(minX, minY, maxX, maxY);
}

double distanceToPolyline(Offset point, List<Offset> points) {
  if (points.length < 2) {
    return double.infinity;
  }

  var minDistance = double.infinity;

  for (var i = 0; i < points.length - 1; i++) {
    final distance = _distanceToSegment(point, points[i], points[i + 1]);

    minDistance = math.min(minDistance, distance);
  }

  return minDistance;
}

double _distanceToSegment(Offset point, Offset start, Offset end) {
  final segment = end - start;
  final lengthSquared = segment.distanceSquared;

  if (lengthSquared == 0) {
    return (point - start).distance;
  }

  final t =
      ((point - start).dx * segment.dx + (point - start).dy * segment.dy) /
      lengthSquared;

  final clampedT = t.clamp(0.0, 1.0);

  final projection = Offset(
    start.dx + segment.dx * clampedT,
    start.dy + segment.dy * clampedT,
  );

  return (point - projection).distance;
}
