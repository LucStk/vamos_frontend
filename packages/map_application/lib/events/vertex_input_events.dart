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

class ButtonStartSegment extends VertexInputEvent {
  const ButtonStartSegment();
}

class VertexTapped extends VertexInputEvent {
  final VertexId vertexId;
  const VertexTapped(this.vertexId);
}

class VertexDoubleTapped extends VertexInputEvent {
  final VertexId vertexId;
  const VertexDoubleTapped(this.vertexId);
}

class VertexDragStarted extends VertexInputEvent {
  final VertexId vertexId;
  const VertexDragStarted(this.vertexId);
}

class VertexDragEnd extends VertexInputEvent {
  final VertexId vertexId;
  final LatLng latLng;
  const VertexDragEnd(this.vertexId, this.latLng);
}

class VertexDragUpdate extends VertexInputEvent {
  final LatLng latLng;
  const VertexDragUpdate(this.latLng);
}
