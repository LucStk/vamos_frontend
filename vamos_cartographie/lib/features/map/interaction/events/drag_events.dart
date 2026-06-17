part of 'events.dart';

/// DRAG vertex
class VertexDragStarted extends MapInteractionEvent {
  final Id<Vertex> vertexId;
  const VertexDragStarted(this.vertexId);
}

class VertexDragged extends MapInteractionEvent {
  final Id<Vertex> vertexId;
  final LatLng position;

  const VertexDragged(this.vertexId, this.position);
}

class VertexDragEnded extends MapInteractionEvent {
  final Id<Vertex> vertexId;
  final LatLng position;

  const VertexDragEnded(this.vertexId, this.position);
}

class WaypointDragStarted extends MapInteractionEvent {
  final Id<Vertex> vertexId;
  const WaypointDragStarted(this.vertexId);
}

class WaypointDragged extends MapInteractionEvent {
  final Id<Vertex> vertexId;
  final LatLng position;

  const WaypointDragged(this.vertexId, this.position);
}

class WaypointDragEnded extends MapInteractionEvent {
  final Id<Vertex> vertexId;
  final LatLng position;

  const WaypointDragEnded(this.vertexId, this.position);
}
