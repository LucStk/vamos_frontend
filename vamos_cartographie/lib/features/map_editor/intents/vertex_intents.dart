part of 'intents.dart';

class SelectVertex extends MapIntents {
  final Id<Vertex> vertexId;
  const SelectVertex(this.vertexId);
}

class StartDragVertex extends MapIntents {
  const StartDragVertex();
}

class EndDragVertex extends MapIntents {
  final Id<Vertex> vertexId;
  final LatLng position;

  const EndDragVertex(this.vertexId, this.position);
}
