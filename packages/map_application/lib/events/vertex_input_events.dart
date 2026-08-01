part of "events.dart";

sealed class VertexInputEvent extends MapInputEvent {
  const VertexInputEvent();
}

class VertexButtonDeleteTapped extends VertexInputEvent {
  const VertexButtonDeleteTapped();
}

class VertexButtonCreateWaypoint extends VertexInputEvent {
  const VertexButtonCreateWaypoint();
}

class VertexTapped extends VertexInputEvent {
  final VertexFields vertex;
  const VertexTapped(this.vertex);
}

class VertexDoubleTapped extends VertexInputEvent {
  final VertexId vertexId;
  const VertexDoubleTapped(this.vertexId);
}

class VertexDragStarted extends VertexInputEvent {
  final VertexId vertexId;
  const VertexDragStarted(this.vertexId);
}

class VertexDragEnded extends VertexInputEvent {
  final VertexId vertexId;
  final LatLng latLng;
  const VertexDragEnded(this.vertexId, this.latLng);
}

class VertexDragUpdated extends VertexInputEvent {
  final VertexId vertexId;
  final LatLng latLng;
  const VertexDragUpdated(this.vertexId, this.latLng);
}
