part of "input_events.dart";

sealed class VertexEvent extends MapInputEvent {
  const VertexEvent();
}

class VertexButtonDeleteTapped extends VertexEvent {
  const VertexButtonDeleteTapped();
}

class VertexButtonCreateWaypoint extends VertexEvent {
  const VertexButtonCreateWaypoint();
}

class ButtonStartSegment extends VertexEvent {
  const ButtonStartSegment();
}

class VertexTapped extends VertexEvent {
  final VertexId vertexId;
  const VertexTapped(this.vertexId);
}

class VertexDoubleTapped extends VertexEvent {
  final VertexId vertexId;
  const VertexDoubleTapped(this.vertexId);
}

class VertexDragStarted extends VertexEvent {
  final VertexId vertexId;
  const VertexDragStarted(this.vertexId);
}

class VertexDragEnd extends VertexEvent {
  final VertexId vertexId;
  final LatLng latLng;
  const VertexDragEnd(this.vertexId, this.latLng);
}

class VertexDragUpdate extends CursorEvent {
  final LatLng latLng;
  const VertexDragUpdate(this.latLng);
}
