import 'package:latlong2/latlong.dart';
import 'package:domain_core/domain_core.dart';
import 'package:trip_domain/domain/entities/vertex.dart';

sealed class MapEffect {
  const MapEffect();
}

class MoveVertexEffect extends MapEffect {
  final Id<Vertex> vertexId;
  final LatLng newPosition;

  const MoveVertexEffect({required this.vertexId, required this.newPosition});
}
