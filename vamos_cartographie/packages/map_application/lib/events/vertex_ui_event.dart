part of "ui_events.dart";

class VertexTapped extends MapUiEvent {
  final VertexRef vertexRef;
  const VertexTapped(this.vertexRef);
}

class VertexDoubleTapped extends MapUiEvent {
  final VertexRef vertexRef;
  const VertexDoubleTapped(this.vertexRef);
}

class VertexDragStarted extends MapUiEvent {
  final VertexRef vertexRef;
  const VertexDragStarted(this.vertexRef);
}

class VertexDragEnd extends MapUiEvent {
  final VertexRef vertexRef;
  final LatLng latLng;
  const VertexDragEnd(this.vertexRef, this.latLng);
}
