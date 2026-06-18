part of "ui_events.dart";

class VertexTapped extends MapUiEvent {
  final Id<Vertex> vertexId;
  const VertexTapped(this.vertexId);
}

class VertexDoubleTapped extends MapUiEvent {
  final Id<Vertex> vertexId;
  const VertexDoubleTapped(this.vertexId);
}

class VertexDragStarted extends MapUiEvent {
  final Id<Vertex> vertexId;
  const VertexDragStarted(this.vertexId);
}

class VertexDragEndend extends MapUiEvent {
  final Id<Vertex> vertexId;
  const VertexDragEndend(this.vertexId);
}
