part of "events.dart";

sealed class VertexEvent extends MapEvent {
  const VertexEvent();
}

class VertexTapped extends VertexEvent {
  final VertexRef vertexRef;
  const VertexTapped(this.vertexRef);
}

class VertexDoubleTapped extends VertexEvent {
  final VertexRef vertexRef;
  const VertexDoubleTapped(this.vertexRef);
}

class VertexDragStarted extends VertexEvent {
  final VertexRef vertexRef;
  const VertexDragStarted(this.vertexRef);
}

class VertexDragEnd extends VertexEvent {
  final VertexRef vertexRef;
  final LatLng latLng;
  const VertexDragEnd(this.vertexRef, this.latLng);
}
