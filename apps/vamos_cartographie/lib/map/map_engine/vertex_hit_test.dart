// lib/map/rendering/helpers/vertex_hit_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:trip_application/topology/topology.dart';
import 'package:map_application/map_application.dart';

List<VertexHit> hitTestVertex({
  required Offset point,
  required List<VertexFields> vertices,
  required MapController mapController,
  double thresholdPx = 10,
}) {
  List<VertexHit> hits = [];

  for (final v in vertices) {
    final vPx = mapController.camera.latLngToScreenOffset(v.latLng);
    final dist = (point - vPx).distance;
    if (dist <= thresholdPx) {
      hits.add(VertexHit(v));
    }
  }
  return hits;
}
