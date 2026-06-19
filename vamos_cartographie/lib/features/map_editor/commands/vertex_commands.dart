part of 'commands.dart';

class SelectVertex extends MapCommand {
  final Id<Vertex> vertexId;
  const SelectVertex(this.vertexId);
}

class StartDragVertex extends MapCommand {
  const StartDragVertex();
}

class EndDragVertex extends MapCommand {
  final Id<Vertex> vertexId;
  final LatLng position;

  const EndDragVertex(this.vertexId, this.position);
}
