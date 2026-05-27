import 'package:vamos_cartographie/graphql/graphql.dart';
import 'package:gql_tristate_value/gql_tristate_value.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/features/waypoints/domain/entities/entities.dart';

class WaypointMapper {
  /// Convertit un [GWaypointFieldsData] (fragment GQL) en [Waypoint] domaine.
  static Waypoint waypointFromGQL(GWaypointFields data) => Waypoint(
    id: data.id,
    latLng: LatLng(data.lat, data.lng),
    type: data.type,
    title: data.title,
    description: data.description,
  );

  /// Convertit un [Waypoint] domaine en [GWaypointInput] pour les mutations.
  static GWaypointInput waypointToGQLInput(Waypoint w) => GWaypointInput(
    lat: w.latLng.latitude,
    lng: w.latLng.longitude,
    type: w.type,
    description: w.description != null && w.description!.isNotEmpty
        ? Value.present(w.description)
        : const Value.absent(),
    title: w.title != null && w.title!.isNotEmpty
        ? Value.present(w.title)
        : const Value.absent(),
  );
  static GWaypointUpdateInput waypointToGQLUpdateInput(Waypoint w) =>
      GWaypointUpdateInput(
        lat: Value.present(w.latLng.latitude),
        lng: Value.present(w.latLng.longitude),
        type: Value.present(w.type),
        description: w.description != null && w.description!.isNotEmpty
            ? Value.present(w.description)
            : const Value.absent(),
        title: w.title != null && w.title!.isNotEmpty
            ? Value.present(w.title)
            : const Value.absent(),
      );
}
