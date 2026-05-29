import 'package:vamos_cartographie/graphql/graphql.dart';
import 'package:gql_tristate_value/gql_tristate_value.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/features/waypoints/domain/entities/entities.dart';

class WaypointMapper {
  /// Convertit un [GWaypointFieldsData] (fragment GQL) en [Waypoint] domaine.
  static Waypoint fromGQL(GWaypointFields data) => Waypoint(
    id: data.id,
    latLng: LatLng(data.lat, data.lng),
    type: data.type,
    title: data.title,
    description: data.description,
  );
}
