import 'package:latlong2/latlong.dart';

/// Point à la position [pos] de la polyline : le sommet `i` plus la fraction
/// `pos - i` du segment suivant.
LatLng _pointAt(List<LatLng> pts, double pos) {
  final i = pos.floor().clamp(0, pts.length - 2);
  final t = (pos - i).clamp(0.0, 1.0);
  final a = pts[i], b = pts[i + 1];
  return LatLng(
    a.latitude + (b.latitude - a.latitude) * t,
    a.longitude + (b.longitude - a.longitude) * t,
  );
}

/// Extrait la portion de [from] à [to] (positions décimales sur la polyline),
/// avec un point interpolé à chaque extrémité.
/// Renvoie `null` si la section est dégénérée.
List<LatLng>? sliceBetweenPositions(
  List<LatLng> points,
  double from,
  double to,
) {
  if (points.length < 2) return null;
  final last = (points.length - 1).toDouble();
  final a = from.clamp(0.0, last);
  final b = to.clamp(0.0, last);
  if (b <= a) return null;

  return [
    _pointAt(points, a),
    // Sommets strictement entre les deux bornes.
    for (var i = a.floor() + 1; i < b.ceil(); i++) points[i],
    _pointAt(points, b),
  ];
}
