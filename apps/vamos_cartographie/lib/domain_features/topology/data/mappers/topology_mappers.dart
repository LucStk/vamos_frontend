import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/domain_features.dart';

/// Centralise toutes les conversions GQL ↔ Domain pour les entités Trip.
extension GGetTopologyDataTopologyMapper on GGetTopologyData_trip_topology {
  TopologyRes toDomain() {
    final List<VertexRemoteModel> lV = vertices
        .map((m) => m.toDomain())
        .toList();
    final List<SegmentRemoteModel> lS = segments
        .map((GSegmentFields m) => m.toDomain())
        .toList();
    return TopologyRes(lV, lS);
  }
}
