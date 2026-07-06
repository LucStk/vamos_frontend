import '/domain/entities/entities.dart';

class TopologyRes {
  final List<Vertex> vertices;

  final List<Segment> segments;
  TopologyRes(this.vertices, this.segments);
}

class WaypointCreateBlankRes {
  final Vertex vertex;
  final Waypoint waypoint;
  WaypointCreateBlankRes(this.waypoint, this.vertex);
}
