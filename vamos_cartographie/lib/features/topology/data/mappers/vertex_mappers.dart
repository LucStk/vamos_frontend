import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/features/topology/domain/domain.dart';
import 'package:vamos_cartographie/graphql/graphql.dart';

/// Centralise toutes les conversions GQL ↔ Domain pour les entités Trip.
class VertexMapper {
  /// Convertit un [GSegmentFieldsData] (fragment GQL) en [Segment] domaine.
  static Vertex fromGQL(GVertexFields data) =>
      Vertex(id: data.id, latLng: LatLng(data.latLng.lat, data.latLng.lng));
  static GLatLngInput toGql(LatLng latLng) =>
      GLatLngInput(lat: latLng.latitude, lng: latLng.longitude);
}
