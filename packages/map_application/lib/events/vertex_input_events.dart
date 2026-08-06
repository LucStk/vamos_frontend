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
