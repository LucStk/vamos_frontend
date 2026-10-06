import 'package:trip_application/trip_application.dart';

import '../graphql/graphql.dart';
import 'geometry_mapper.dart';

/// Centralise toutes les conversions GQL ↔ Domain pour les entités Trip.
class VertexMapper {
  /// Convertit un [GSegmentFieldsData] (fragment GQL) en [Segment] domaine.
}

extension GVertexFieldsMapper on GVertexFields {
  VertexRemoteModel toDomain() =>
      VertexRemoteModel(id: VertexId(id), latLng: latLng.toLatLng());
}
