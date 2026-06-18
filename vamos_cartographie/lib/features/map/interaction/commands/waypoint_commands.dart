part of 'commands.dart';

class OpenEditWaypointDialog extends MapCommand {
  final Id<Waypoint> waypointId;
  const OpenEditWaypointDialog(this.waypointId);
}

class SelectWaypoint extends MapCommand {
  final Id<Waypoint> waypointId;
  const SelectWaypoint(this.waypointId);
}

class StartDragWaypoint extends MapCommand {
  const StartDragWaypoint();
}

class EndDragWaypoint extends MapCommand {
  final Id<Waypoint> waypointId;
  final LatLng position;

  const EndDragWaypoint(this.waypointId, this.position);
}
