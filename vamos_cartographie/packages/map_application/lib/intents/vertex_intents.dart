part of 'intents.dart';

class SelectVertex extends MapIntents {
  final VertexRef vertexRef;
  const SelectVertex(this.vertexRef);
}

class UpdateVertexPosition extends MapIntents {
  final VertexRef vertexRef;
  final LatLng position;
  const UpdateVertexPosition(this.vertexRef, this.position);
}

class CreateSimpleVertex extends MapIntents {
  final LatLng position;
  const CreateSimpleVertex(this.position);
}

class CreateWaypointVertex extends MapIntents {
  final LatLng position;
  const CreateWaypointVertex(this.position);
}
