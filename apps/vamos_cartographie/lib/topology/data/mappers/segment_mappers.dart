import 'package:domain_core/domain_core.dart';
import 'package:trip_application/trip_application.dart';
import '/core/graphql/graphql.dart';
import "/topology/data/graphql/graphql.dart";
import "mobility_type_mapper.dart";
import 'package:gql_tristate_value/gql_tristate_value.dart';
import "gis_mapper.dart" show GisMapper;

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
  static GSegmentUpdateInput toGQLUpdateInput(Segment s) {
    return GSegmentUpdateInput(
      mobilityType: Value.present(s.mobilityType.toGQL()),
      // startVertexId: Value.present(s.startVertexId.value),
      // endVertexId: Value.present(s.endVertexId.value),
    );
  }
}
