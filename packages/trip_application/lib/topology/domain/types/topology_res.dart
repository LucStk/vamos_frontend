import 'package:stored_file_application/stored_file_application.dart';
import 'package:trip_application/waypoint/domain/domain.dart';

import '/topology/domain/entities/entities.dart';

class TopologyRes {
  final List<VertexRemoteModel> vertices;

  final List<SegmentRemoteModel> segments;
  TopologyRes(this.vertices, this.segments);
}

class WaypointCreateBlankRes {
  final VertexRemoteModel vertex;
  final WaypointRemoteModel waypoint;
  WaypointCreateBlankRes(this.waypoint, this.vertex);
}

class TripDetailsRes {
  final List<VertexRemoteModel> vertices;
  final List<SegmentRemoteModel> segments;
  final List<(WaypointRemoteModel, List<StoredFileRemoteModel>)>
  waypointsImages;
  TripDetailsRes(this.vertices, this.segments, this.waypointsImages);
}
