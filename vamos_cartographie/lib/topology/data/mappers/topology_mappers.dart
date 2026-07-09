import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/topology/data/graphql/queries/__generated__/topology_queries.data.gql.dart';
import 'package:vamos_cartographie/topology/data/mappers/segment_mappers.dart';
import 'package:vamos_cartographie/topology/data/mappers/vertex_mappers.dart';

/// Centralise toutes les conversions GQL ↔ Domain pour les entités Trip.
class TopologyMappers {
  /// Convertit un [GSegmentFieldsData] (fragment GQL) en [Segment] domaine.
  static TopologyRes fromGQL(GGetTopologyData_trip_topology data) {
    final lV = data.vertices.map(VertexMapper.fromGQL).toList();
    final lS = data.segments.map(SegmentMapper.fromGQL).toList();
    return TopologyRes(lV, lS);
  }
}
