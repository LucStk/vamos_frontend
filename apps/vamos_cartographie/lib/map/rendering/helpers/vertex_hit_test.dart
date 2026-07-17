// lib/map/rendering/helpers/vertex_hit_test.dart
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:trip_application/topology/topology.dart';

VertexFields? findNearbyVertex({
  required LatLng point,
  required List<VertexFields> vertices,
  required MapController mapController,
  double thresholdPx = 24,
}) {
  final pointPx = mapController.camera.latLngToScreenOffset(point);

  VertexFields? closest;
  double closestDist = double.infinity;

  for (final v in vertices) {
    final vPx = mapController.camera.latLngToScreenOffset(v.latLng);
    final dist = (pointPx - vPx).distance;
    if (dist <= thresholdPx && dist < closestDist) {
      closest = v;
      closestDist = dist;
    }
  }
  return closest;
}
