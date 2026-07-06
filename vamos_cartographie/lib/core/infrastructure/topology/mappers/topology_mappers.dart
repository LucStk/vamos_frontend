import 'package:trip_domain/domain/types/topology_res.dart';
import 'package:trip_domain/trip_domain.dart';
import 'package:vamos_cartographie/core/infrastructure/topology/mappers/segment_mappers.dart';
import 'package:vamos_cartographie/core/infrastructure/topology/mappers/vertex_mappers.dart';
import '/core/graphql/graphql.dart';

/// Centralise toutes les conversions GQL ↔ Domain pour les entités Trip.
class TopologyMappers {
  /// Convertit un [GSegmentFieldsData] (fragment GQL) en [Segment] domaine.
  static TopologyRes fromGQL(GGetTopologyData_trip_topology data) {
    final lV = data.vertices.map(VertexMapper.fromGQL).toList();
    final lS = data.segments.map(SegmentMapper.fromGQL).toList();
    return TopologyRes(lV, lS);
  }
}
