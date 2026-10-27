import 'package:domain_core/domain_core.dart';
import 'package:trip_application/trip_application.dart';
import 'package:ferry/ferry.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/core/graphql/graphql.dart';
import 'package:vamos_cartographie/core/network/ferry_client_x.dart';
import 'package:vamos_cartographie/domain_features/waypoint/waypoint.dart';
import 'package:vamos_cartographie/domain_features/waypoint/data/graphql/graphql.dart';

/// Datasource distant pour les opérations sur les trips.
/// Communique directement avec le backend via le ferryClient Ferry (GraphQL).
/// Retourne des types GQL bruts – c'est le repository qui se charge
/// de les convertir en modèles domaine via [TripMapper].
class WaypointRemoteDatasource {
  final Client ferryClient;

  WaypointRemoteDatasource(this.ferryClient);

  Future<GWaypointDetails> createBlankWaypointFromPosition({
    required Id<Trip> tripId,
    required LatLng latLng,
  }) async {
    final data = await ferryClient.execute(
      GCreateBlankWaypointFromPositionReq(
        vars: GCreateBlankWaypointFromPositionVars(
          tripId: tripId.value,
          latLng: GLatLngInput(lat: latLng.latitude, lng: latLng.longitude),
        ),
      ),
    );
    return data.createBlankWaypointFromPosition;
  }

  Future<GWaypointDetails> updateWaypoint({
    required WaypointId id,
    required GWaypointUpdateInput input,
  }) async {
    final data = await ferryClient.execute(
      GUpdateWaypointReq(
        vars: GUpdateWaypointVars(id: id.value, waypoint: input),
      ),
    );
    return data.updateWaypoint;
  }

  Future<void> deleteWaypoint({required WaypointId id}) async {
    await ferryClient.execute(
      GDeleteWaypointReq(vars: GDeleteWaypointVars(id: id.value)),
    );
  }
}
