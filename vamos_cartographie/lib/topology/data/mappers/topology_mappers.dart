import 'package:trip_domain/domain/types/topology_res.dart';
import 'package:trip_domain/trip_domain.dart';
import 'package:vamos_cartographie/topology/data/graphql/queries/__generated__/topology_queries.data.gql.dart';
import 'package:vamos_cartographie/topology/data/mappers/segment_mappers.dart';
import 'package:vamos_cartographie/topology/data/mappers/vertex_mappers.dart';

/// Centralise toutes les conversions GQL ↔ Domain pour les entités Trip.
class TopologyMappers {
  /// Convertit un [GSegmentFieldsData] (fragment GQL) en [Segment] domaine.
  static TopologyRes fromGQL(GGetTopologyData_trip_topology data) {
    final lV = data.vertices.map(VertexMapper.fromGQL).toList() as List<Vertex>;
    final lS =
        data.segments.map(SegmentMapper.fromGQL).toList() as List<Segment>;
    return TopologyRes(lV, lS);
  }
}
