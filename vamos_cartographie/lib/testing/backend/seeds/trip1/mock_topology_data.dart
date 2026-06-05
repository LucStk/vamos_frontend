import 'package:vamos_cartographie/features/topology/topology.dart';
import 'package:vamos_cartographie/vamos_cartographie.dart';

import 'package:latlong2/latlong.dart';

final List<Vertex> tripVertex = [
  Vertex(id: 21, latLng: LatLng(48.5734, 7.7521)),
  Vertex(id: 22, latLng: LatLng(48.2500, 7.3100)),
  Vertex(id: 23, latLng: LatLng(48.0791, 7.350)),
  Vertex(id: 24, latLng: LatLng(47.8683, 7.3174)),
  Vertex(id: 25, latLng: LatLng(47.7508, 7.3359)),
];
final List<Segment> tripSegments = [
  Segment(id: 101, type: SegmentType.bike, startVertexId: 21, endVertexId: 22),
  Segment(id: 102, type: SegmentType.bike, startVertexId: 22, endVertexId: 23),
  Segment(id: 103, type: SegmentType.walk, startVertexId: 23, endVertexId: 24),
  Segment(id: 104, type: SegmentType.bike, startVertexId: 24, endVertexId: 25),
];
