import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/features/topology/topology.dart';
import 'package:vamos_cartographie/vamos_cartographie.dart';

sealed class MapEffect {
  const MapEffect();
}

class MoveVertexEffect extends MapEffect {
  final Id<Vertex> vertexId;
  final LatLng newPosition;

  const MoveVertexEffect({required this.vertexId, required this.newPosition});
}
