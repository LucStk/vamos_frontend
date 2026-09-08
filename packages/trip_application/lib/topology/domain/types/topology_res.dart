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

class CreateSegmentPayload {
  final VertexRemoteModel vertex;
  final SegmentRemoteModel segment;
  final bool rafinementFailed;
  final String? errorMessage;
  CreateSegmentPayload({
    required this.vertex,
    required this.segment,
    required this.rafinementFailed,
    this.errorMessage,
  });
}

class RefineSegmentPayload {
  final SegmentFields segment;
  final bool rafinementFailed;
  final String? errorMessage;
  RefineSegmentPayload({
    required this.segment,
    required this.rafinementFailed,
    this.errorMessage,
  });
}
