part of 'map_effect.dart';

class CreateSimpleVertexEffect extends MapEffect {
  final LatLng position;
  const CreateSimpleVertexEffect({required this.position});
}

class MoveVertexEffect extends MapEffect {
  final VertexRef vertexRef;
  final LatLng newPosition;

  const MoveVertexEffect({required this.vertexRef, required this.newPosition});
}
