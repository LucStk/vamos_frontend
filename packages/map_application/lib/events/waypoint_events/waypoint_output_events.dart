part of "../events.dart";

sealed class WaypointOutputEvent extends MapOutputEvent {
  const WaypointOutputEvent();
}

class WaypointCreated extends WaypointOutputEvent {
  final WaypointId waypointId;
  const WaypointCreated(this.waypointId);
}

class WaypointCreateFailed extends WaypointOutputEvent {
  const WaypointCreateFailed();
}

class WaypointOpenDialog extends WaypointOutputEvent {
  final WaypointId waypointId;
  const WaypointOpenDialog(this.waypointId);
}
