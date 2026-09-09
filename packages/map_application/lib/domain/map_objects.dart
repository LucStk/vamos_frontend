import 'dart:ui';

import 'package:latlong2/latlong.dart';
import 'package:trip_application/topology/domain/domain.dart';

sealed class MapObject {
  const MapObject();

  bool get isHitTestable;
}

sealed class MapPoint extends MapObject {
  const MapPoint();
  LatLng get position;
  double get radius;
}

sealed class MapLine extends MapObject {
  const MapLine();
  List<LatLng> get geometry;
  double get radius;
}

class MapVertex extends MapPoint {
  final VertexId vertexId;
  @override
  final LatLng position;

  @override
  final radius = 24;

  @override
  final isHitTestable = true;

  MapVertex({required this.vertexId, required this.position});
}

class MapSegment extends MapLine {
  final SegmentId segmentId;
  @override
  final List<LatLng> geometry;

  const MapSegment({required this.segmentId, required this.geometry});

  @override
  final double radius = 10;

  @override
  final bool isHitTestable = true;
}
