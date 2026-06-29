part of "ui_events.dart";

class VertexTapped extends MapUiEvent {
  final VertexUiId vertexId;
  const VertexTapped(this.vertexId);
}

class VertexDoubleTapped extends MapUiEvent {
  final VertexUiId vertexId;
  const VertexDoubleTapped(this.vertexId);
}

class VertexDragStarted extends MapUiEvent {
  final VertexUiId vertexId;
  const VertexDragStarted(this.vertexId);
}

class VertexDragEndend extends MapUiEvent {
  final VertexUiId vertexId;
  const VertexDragEndend(this.vertexId);
}
