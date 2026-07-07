part of 'intents.dart';

class CreateWaypointFromVertex extends MapIntents {
  final VertexRef vertexRef;
  const CreateWaypointFromVertex(this.vertexRef);
}

class OpenEditWaypointDialog extends MapIntents {
  final Id<Waypoint> waypointId;
  const OpenEditWaypointDialog(this.waypointId);
}

class SelectWaypoint extends MapIntents {
  final Id<Waypoint> waypointId;
  const SelectWaypoint(this.waypointId);
}

class StartDragWaypoint extends MapIntents {
  const StartDragWaypoint();
}

class EndDragWaypoint extends MapIntents {
  final Id<Waypoint> waypointId;
  final LatLng position;

  const EndDragWaypoint(this.waypointId, this.position);
}
