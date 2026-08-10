import 'package:latlong2/latlong.dart';

class ClosestPointResult {
  const ClosestPointResult({
    required this.point,
    required this.segmentIndex,
    required this.distanceMeters,
  });
  final LatLng point;
  final int segmentIndex; // le point se trouve sur le segment [i, i+1]
  final double distanceMeters;
}

/// Projette p sur le segment [a,b] (coordonnées génériques x/y).
/// Retourne le paramètre t ∈ [0,1] du point projeté sur le segment.
double projectScalarOnSegment({
  required double px,
  required double py,
  required double ax,
  required double ay,
  required double bx,
  required double by,
}) {
  final dx = bx - ax;
  final dy = by - ay;
  final lengthSquared = dx * dx + dy * dy;
  if (lengthSquared == 0) return 0.0;
  final t = ((px - ax) * dx + (py - ay) * dy) / lengthSquared;
  return t.clamp(0.0, 1.0);
}

LatLng projectOnSegment(LatLng p, LatLng a, LatLng b) {
  final t = projectScalarOnSegment(
    px: p.longitude,
    py: p.latitude,
    ax: a.longitude,
    ay: a.latitude,
    bx: b.longitude,
    by: b.latitude,
  );
  return LatLng(
    a.latitude + t * (b.latitude - a.latitude),
    a.longitude + t * (b.longitude - a.longitude),
  );
}

ClosestPointResult closestPointOnPolyline(
  LatLng target,
  List<LatLng> polyline,
) {
  const distance = Distance();
  var best = ClosestPointResult(
    point: polyline.first,
    segmentIndex: 0,
    distanceMeters: double.infinity,
  );
  for (var i = 0; i < polyline.length - 1; i++) {
    final projected = projectOnSegment(target, polyline[i], polyline[i + 1]);
    final d = distance.distance(target, projected);
    if (d < best.distanceMeters) {
      best = ClosestPointResult(
        point: projected,
        segmentIndex: i,
        distanceMeters: d,
      );
    }
  }
  return best;
}
