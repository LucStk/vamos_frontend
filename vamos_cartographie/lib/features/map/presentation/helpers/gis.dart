import 'package:latlong2/latlong.dart';

LatLng boundsCenter(List<LatLng> points) {
  final minLat = points.map((p) => p.latitude).reduce((a, b) => a < b ? a : b);
  final maxLat = points.map((p) => p.latitude).reduce((a, b) => a > b ? a : b);

  final minLng = points.map((p) => p.longitude).reduce((a, b) => a < b ? a : b);
  final maxLng = points.map((p) => p.longitude).reduce((a, b) => a > b ? a : b);

  return LatLng((minLat + maxLat) / 2, (minLng + maxLng) / 2);
}
