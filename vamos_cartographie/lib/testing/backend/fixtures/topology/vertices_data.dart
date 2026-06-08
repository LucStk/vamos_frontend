import 'package:vamos_cartographie/features/topology/topology.dart';

import 'package:latlong2/latlong.dart';

final List<Vertex> t1Vertices = [
  Vertex(id: 10, latLng: LatLng(48.8566, 2.3522)),
  Vertex(id: 11, latLng: LatLng(48.1173, -1.6778)),
  Vertex(id: 12, latLng: LatLng(48.3904, -4.4861)),
  Vertex(id: 13, latLng: LatLng(47.6587, -2.7600)),
  Vertex(id: 14, latLng: LatLng(47.2184, -1.5536)),
];
final List<Vertex> t2Vertices = [
  Vertex(id: 21, latLng: LatLng(48.5734, 7.7521)),
  Vertex(id: 22, latLng: LatLng(48.2500, 7.3100)),
  Vertex(id: 23, latLng: LatLng(48.0791, 7.350)),
  Vertex(id: 24, latLng: LatLng(47.8683, 7.3174)),
  Vertex(id: 25, latLng: LatLng(47.7508, 7.3359)),
];
final List<Vertex> t3Vertices = [
  Vertex(id: 30, latLng: LatLng(43.4929, -1.4748)),
  Vertex(id: 31, latLng: LatLng(43.2951, -0.3708)),
  Vertex(id: 32, latLng: LatLng(43.1042, -0.0785)),
  Vertex(id: 33, latLng: LatLng(43.0958, -0.0461)),
];
final verticesMockData = [...t1Vertices, ...t2Vertices, ...t3Vertices];
final Map<int, Vertex> vertexMapMock = {
  for (final vertex in verticesMockData) vertex.id: vertex,
};
