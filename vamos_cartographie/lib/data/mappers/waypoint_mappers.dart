import 'package:vamos_cartographie/domain/domain.dart';

import 'package:api_client/api_client.dart';
import 'package:gql_tristate_value/gql_tristate_value.dart';
import 'package:latlong2/latlong.dart';

class WaypointMappers {
  /// Convertit un [GWaypointFieldsData] (fragment GQL) en [Waypoint] domaine.
  static Waypoint waypointFromGQL(GWaypointFieldsData data) => Waypoint(
    id: data.id,
    latLng: LatLng(data.lat, data.lng),
    type: data.type,
    title: data.title,
    description: data.description,
    images: data.images
        .map((i) => TripImage(fileKey: i.image.fileKey, url: i.image.url))
        .toList(),
  );

  /// Convertit un [Waypoint] domaine en [GWaypointInput] pour les mutations.
  static GWaypointInput waypointToGQLInput(Waypoint w) => GWaypointInput(
    lat: w.latLng.latitude,
    lng: w.latLng.longitude,
    type: w.type,
    description: w.description != null && w.description!.isNotEmpty
        ? Value.present(w.description)
        : const Value.absent(),
  );
}
