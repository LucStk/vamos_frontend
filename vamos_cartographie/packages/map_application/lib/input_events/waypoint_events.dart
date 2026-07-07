part of "input_events.dart";

sealed class WaypointEvent extends MapInputEvent {
  const WaypointEvent();
}

class WaypointTapped extends WaypointEvent {
  final WaypointId waypointId;
  const WaypointTapped(this.waypointId);
}

class WaypointDoubleTapped extends WaypointEvent {
  final WaypointId waypointId;
  const WaypointDoubleTapped(this.waypointId);
}

class WaypointDragStarted extends WaypointEvent {
  final WaypointId waypointId;
  const WaypointDragStarted(this.waypointId);
}

class WaypointDragEnded extends WaypointEvent {
  final VertexRef vertexRef;
  final LatLng latLng;
  const WaypointDragEnded(this.vertexRef, this.latLng);
}
