import 'package:vamos_cartographie/features/topology/topology.dart';
import 'package:vamos_cartographie/vamos_cartographie.dart';

import 'package:latlong2/latlong.dart';

final List<Vertex> tripVertex = [
  Vertex(id: 0, latLng: LatLng(48.8566, 2.3522)),
  Vertex(id: 1, latLng: LatLng(48.1173, -1.6778)),
  Vertex(id: 2, latLng: LatLng(48.3904, -4.4861)),
  Vertex(id: 3, latLng: LatLng(47.6587, -2.7600)),
  Vertex(id: 4, latLng: LatLng(47.2184, -1.5536)),
];
final List<Segment> tripSegments = [
  Segment(id: 1, type: SegmentType.train, startVertexId: 0, endVertexId: 1),
  Segment(id: 2, type: SegmentType.bike, startVertexId: 1, endVertexId: 2),
  Segment(id: 3, type: SegmentType.bike, startVertexId: 2, endVertexId: 3),
  Segment(id: 4, type: SegmentType.bike, startVertexId: 3, endVertexId: 4),
];
