part of "input_events.dart";

sealed class WaypointEvent extends MapInputEvent {
  const WaypointEvent();
}

class WaypointTapped extends WaypointEvent {
  final WaypointId waypointId;
  final VertexRef vertexRef;
  const WaypointTapped(this.waypointId, this.vertexRef);
}

class WaypointDoubleTapped extends WaypointEvent {
  final WaypointId waypointId;
  final VertexRef vertexRef;
  const WaypointDoubleTapped(this.waypointId, this.vertexRef);
}

class WaypointDragStarted extends WaypointEvent {
  final VertexRef vertexRef;
  final WaypointId waypointId;
  const WaypointDragStarted(this.waypointId, this.vertexRef);
}

class WaypointDragEnded extends WaypointEvent {
  final WaypointId waypointId;
  final VertexRef vertexRef;
  final LatLng latLng;
  const WaypointDragEnded(this.waypointId, this.vertexRef, this.latLng);
}
