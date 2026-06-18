part of "ui_events.dart";

class WaypointTapped extends MapUiEvent {
  final Id<Waypoint> waypointId;
  const WaypointTapped(this.waypointId);
}

class WaypointDoubleTapped extends MapUiEvent {
  final Id<Waypoint> waypointId;
  const WaypointDoubleTapped(this.waypointId);
}

class WaypointDragStarted extends MapUiEvent {
  final Id<Waypoint> waypointId;
  const WaypointDragStarted(this.waypointId);
}

class WaypointDragEndend extends MapUiEvent {
  final Id<Waypoint> waypointId;
  const WaypointDragEndend(this.waypointId);
}
