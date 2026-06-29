part of "ui_events.dart";

class WaypointTapped extends MapUiEvent {
  final WaypointUiId waypointId;
  const WaypointTapped(this.waypointId);
}

class WaypointDoubleTapped extends MapUiEvent {
  final WaypointUiId waypointId;
  const WaypointDoubleTapped(this.waypointId);
}

class WaypointDragStarted extends MapUiEvent {
  final WaypointUiId waypointId;
  const WaypointDragStarted(this.waypointId);
}

class WaypointDragEnded extends MapUiEvent {
  final WaypointUiId waypointId;
  const WaypointDragEnded(this.waypointId);
}
