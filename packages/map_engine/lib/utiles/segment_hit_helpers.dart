import 'dart:ui';
import 'dart:math' as math;

import 'package:map_engine/visual/domain/world_segment.dart';

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

double distanceToPolyline(Offset position, Iterable<WorldSegment> segments) {
  var minDistance = double.infinity;

  for (final (start, end) in segments) {
    final distance = _distanceToSegment(position, start.value, end.value);

    if (distance < minDistance) {
      minDistance = distance;
    }
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
