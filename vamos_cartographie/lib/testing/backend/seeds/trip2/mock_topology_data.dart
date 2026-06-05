import 'package:vamos_cartographie/features/topology/topology.dart';
import 'package:vamos_cartographie/vamos_cartographie.dart';

import 'package:latlong2/latlong.dart';

final List<Vertex> tripVertex = [
  Vertex(id: 30, latLng: LatLng(43.4929, -1.4748)),
  Vertex(id: 31, latLng: LatLng(43.2951, -0.3708)),
  Vertex(id: 32, latLng: LatLng(43.1042, -0.0785)),
  Vertex(id: 33, latLng: LatLng(43.0958, -0.0461)),
];
final List<Segment> tripSegments = [
  Segment(id: 201, type: SegmentType.bike, startVertexId: 30, endVertexId: 31),
  Segment(id: 202, type: SegmentType.bike, startVertexId: 31, endVertexId: 32),
  Segment(id: 203, type: SegmentType.bike, startVertexId: 32, endVertexId: 33),
];
