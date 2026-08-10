// hit_candidate.dart

part of "hit_candidate.dart";

class PolylineCandidate extends HitCandidate {
  final List<Point<double>> projectedPoints; // déjà projetés en écran
  final double radiusPx;
  @override
  final MapElement element;

  const PolylineCandidate({
    required this.projectedPoints,
    required this.radiusPx,
    required this.element,
  });

  @override
  double distanceTo(Point<double> position) {
    if (projectedPoints.length < 2) {
      return projectedPoints.isEmpty
          ? double.infinity
          : _distanceToPoint(projectedPoints.first, position);
    }
    double minDist = double.infinity;
    for (var i = 0; i < projectedPoints.length - 1; i++) {
      final d = _distanceToSegment(
        projectedPoints[i],
        projectedPoints[i + 1],
        position,
      );
      if (d < minDist) minDist = d;
    }
    return minDist;
  }

  static double _distanceToPoint(Point<double> a, Point<double> b) =>
      sqrt(pow(a.x - b.x, 2) + pow(a.y - b.y, 2));

  static double _distanceToSegment(
    Point<double> a,
    Point<double> b,
    Point<double> p,
  ) {
    final dx = b.x - a.x;
    final dy = b.y - a.y;
    final lengthSq = dx * dx + dy * dy;
    if (lengthSq == 0) return _distanceToPoint(a, p);

    var t = ((p.x - a.x) * dx + (p.y - a.y) * dy) / lengthSq;
    t = t.clamp(0.0, 1.0);

    final projX = a.x + t * dx;
    final projY = a.y + t * dy;
    return _distanceToPoint(Point(projX, projY), p);
  }
}
