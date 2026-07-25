import 'package:trip_application/trip_application.dart';
import "/core/core.dart";
import 'package:vamos_cartographie/topology/data/graphql/fields/__generated__/vertex_fields.data.gql.dart';

/// Centralise toutes les conversions GQL ↔ Domain pour les entités Trip.
class VertexMapper {
  /// Convertit un [GSegmentFieldsData] (fragment GQL) en [Segment] domaine.
}

extension GVertexFieldsMapper on GVertexFields {
  VertexRemoteModel toVertexRemoteModel() =>
      VertexRemoteModel(id: VertexId(id), latLng: latLng.toLatLng());
}
