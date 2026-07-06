part of "events.dart";

sealed class WaypointEvent extends MapEvent {
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
  final WaypointId waypointId;
  const WaypointDragEnded(this.waypointId);
}
