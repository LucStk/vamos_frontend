import 'package:vamos_cartographie/core/type/id.dart';
import 'package:vamos_cartographie/packages/topology_engine/lib/domain/domain.dart';
import 'package:vamos_cartographie/backend/graphql/graphql.dart';
import "mobility_type_mapper.dart";
import "package:vamos_cartographie/features/shared/shared.dart" show GisMapper;

/// Centralise toutes les conversions GQL ↔ Domain pour les entités Trip.
class SegmentMapper {
  /// Convertit un [GSegmentFieldsData] (fragment GQL) en [Segment] domaine.
  static Segment fromGQL(GSegmentFields data) => Segment(
    id: Id<Segment>(data.id),
    mobilityType: data.mobilityType.toDomain(),
    geometry: data.geometry.map((d) => GisMapper.fromGQL(d)).toList(),
    startVertexId: Id<Vertex>(data.startVertex.id),
    endVertexId: Id<Vertex>(data.endVertex.id),
  );
}
