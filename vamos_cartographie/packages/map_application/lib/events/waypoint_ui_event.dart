part of "ui_events.dart";

class WaypointTapped extends MapUiEvent {
  final WaypointId waypointId;
  const WaypointTapped(this.waypointId);
}

class WaypointDoubleTapped extends MapUiEvent {
  final WaypointId waypointId;
  const WaypointDoubleTapped(this.waypointId);
}

class WaypointDragStarted extends MapUiEvent {
  final WaypointId waypointId;
  const WaypointDragStarted(this.waypointId);
}

class WaypointDragEnded extends MapUiEvent {
  final WaypointId waypointId;
  const WaypointDragEnded(this.waypointId);
}
