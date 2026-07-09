import 'package:domain_core/domain_core.dart';
import 'package:trip_domain/trip_domain.dart';
import "package:vamos_cartographie/features/shared/shared.dart" show GisMapper;
import 'package:vamos_cartographie/topology/data/graphql/fields/__generated__/vertex_fields.data.gql.dart';

/// Centralise toutes les conversions GQL ↔ Domain pour les entités Trip.
class VertexMapper {
  /// Convertit un [GSegmentFieldsData] (fragment GQL) en [Segment] domaine.
  static Vertex fromGQL(GVertexFields data) =>
      Vertex(id: Id<Vertex>(data.id), latLng: GisMapper.fromGQL(data.latLng));
}
