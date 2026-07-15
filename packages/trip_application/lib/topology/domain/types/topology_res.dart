import 'package:media_application/media_application.dart';
import 'package:trip_application/waypoint/domain/waypoint.dart';

import '/topology/domain/entities/entities.dart';

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

class TripDetailsRes {
  final List<Vertex> vertices;
  final List<Segment> segments;
  final List<(Waypoint, List<MediaImage>)> waypointsImages;
  TripDetailsRes(this.vertices, this.segments, this.waypointsImages);
}
