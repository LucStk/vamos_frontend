import 'package:media_application/domain/entities/media_image.dart';

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

class TripDetailsRes {
  final List<Vertex> vertices;
  final List<Segment> segments;
  final List<(Waypoint, List<MediaImage>)> waypoints_images;
  TripDetailsRes(this.vertices, this.segments, this.waypoints_images);
}
