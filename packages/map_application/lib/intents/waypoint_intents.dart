part of 'intents.dart';

class CreateWaypointFromVertex extends MapIntents {
  final VertexId vertexId;
  const CreateWaypointFromVertex(this.vertexId);
}

class OpenWaypointDialog extends MapIntents {
  final WaypointId waypointId;
  const OpenWaypointDialog(this.waypointId);
}

class SelectWaypoint extends MapIntents {
  final WaypointId waypointId;
  const SelectWaypoint(this.waypointId);
}

class StartDragWaypoint extends MapIntents {
  const StartDragWaypoint();
}

class EndDragWaypoint extends MapIntents {
  final WaypointId waypointId;
  final LatLng position;

  const EndDragWaypoint(this.waypointId, this.position);
}
