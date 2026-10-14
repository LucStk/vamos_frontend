import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/core/geometry_mappers/position_mapper.dart';
import 'package:vamos_cartographie/domain_features/topology/data/graphql/fields/__generated__/vertex_fields.data.gql.dart';

/// Centralise toutes les conversions GQL ↔ Domain pour les entités Trip.
class VertexMapper {
  /// Convertit un [GSegmentFieldsData] (fragment GQL) en [Segment] domaine.
}

extension GVertexFieldsMapper on GVertexFields {
  VertexRemoteModel toDomain() =>
      VertexRemoteModel(id: VertexId(id), latLng: latLng.toLatLng());
}
