part of 'events.dart';

/// CLICK vertex
class VertexTapped extends MapInteractionEvent {
  final Id<Vertex> vertexId;

  const VertexTapped(this.vertexId);
}

class WaypointTapped extends MapInteractionEvent {
  final Id<Waypoint> waypointId;

  const WaypointTapped(this.waypointId);
}
