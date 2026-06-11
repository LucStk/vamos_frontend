import 'package:vamos_cartographie/features/topology/domain/domain.dart';
import 'package:vamos_cartographie/backend/graphql/graphql.dart';
import "segment_type_mapper.dart";
import "package:vamos_cartographie/features/shared/shared.dart";

/// Centralise toutes les conversions GQL ↔ Domain pour les entités Trip.
class SegmentMapper {
  /// Convertit un [GSegmentFieldsData] (fragment GQL) en [Segment] domaine.
  static Segment fromGQL(GSegmentFields data) => Segment(
    id: data.id,
    type: data.type.toDomain(),
    geometry: data.geometry.map((d) => GisMapper.fromGQL(d)).toList(),
    startVertexId: data.startVertex.id,
    endVertexId: data.endVertex.id,
  );
}
