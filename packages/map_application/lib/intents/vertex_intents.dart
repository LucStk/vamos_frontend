part of 'intents.dart';

class SelectVertex extends MapIntents {
  final VertexId vertexId;
  const SelectVertex(this.vertexId);
}

class UpdateVertexPosition extends MapIntents {
  final VertexId vertexId;
  final LatLng position;
  const UpdateVertexPosition(this.vertexId, this.position);
}

class CreateSimpleVertex extends MapIntents {
  final LatLng position;
  const CreateSimpleVertex(this.position);
}

class CreateWaypointVertex extends MapIntents {
  final LatLng position;
  const CreateWaypointVertex(this.position);
}

class RemoveVertex extends MapIntents {
  final VertexId vertexId;
  const RemoveVertex(this.vertexId);
}
