// route_polyline.dart
import 'dart:math';
import 'dart:ui';
import 'package:domain_core/domain_core.dart';

/// Position continue sur une polyligne : partie entière = index du point,
/// partie décimale = avancement vers le point suivant.
final class RoutePolyline {
  const RoutePolyline(this.points) : assert(points.length >= 2);
  final List<WorldOffset> points;

  double get maxPosition => (points.length - 1).toDouble();

  int _segment(double pos) => pos.floor().clamp(0, points.length - 2);

  WorldOffset pointAt(double pos) {
    final i = _segment(pos);
    final t = (pos - i).clamp(0.0, 1.0);
    return WorldOffset(Offset.lerp(points[i].value, points[i + 1].value, t)!);
  }

  /// Angle de la tangente locale (0 = vers la droite de l'écran).
  double angleAt(double pos) {
    final i = _segment(pos);
    final d = points[i + 1].value - points[i].value;
    return atan2(d.dy, d.dx);
  }

  /// Position du point de la route le plus proche de [p], bornée à [min, max].
  double project(WorldOffset p, {double min = 0, double? max}) {
    final hi = max ?? maxPosition;
    var bestPos = min;
    var bestDist2 = double.infinity;

    for (var i = min.floor(); i < hi.ceil() && i < points.length - 1; i++) {
      final t = segmentParam(points[i], points[i + 1], p);
      final pos = (i + t).clamp(min, hi);
      final q = pointAt(pos).value - p.value;
      final d2 = q.dx * q.dx + q.dy * q.dy;
      if (d2 < bestDist2) {
        bestDist2 = d2;
        bestPos = pos;
      }
    }
    return bestPos;
  }
}

/// Paramètre t ∈ [0,1] de la projection de [p] sur le segment [a, b].
double segmentParam(WorldOffset a, WorldOffset b, WorldOffset p) {
  final ab = b.value - a.value;
  final len2 = ab.dx * ab.dx + ab.dy * ab.dy;
  if (len2 == 0) return 0;
  final ap = p.value - a.value;
  return ((ap.dx * ab.dx + ap.dy * ab.dy) / len2).clamp(0.0, 1.0);
}
