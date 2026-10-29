import 'package:gql_tristate_value/gql_tristate_value.dart';
import 'package:latlong2/latlong.dart';
import 'package:user_profile_application/user_profile_application.dart';

import 'package:ferry/ferry.dart';
import 'package:domain_core/domain_core.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/core/mappers/geometry_mappers/position_mapper.dart';
import 'package:vamos_cartographie/core/graphql/graphql.dart';
import 'package:vamos_cartographie/core/network/ferry_client_x.dart';
import 'package:vamos_cartographie/domain_features/route/data/graphql/__generated__/route_fields.data.gql.dart';
import 'package:vamos_cartographie/domain_features/trip/data/graphql/graphql.dart';

/// Datasource distant pour les opérations sur les trips.
/// Communique directement avec le backend via le ferryClient Ferry (GraphQL).
/// Retourne des types GQL bruts – c'est le repository qui se charge
/// de les convertir en modèles domaine via [TripMapper].
class TripRemoteDatasource {
  final Client ferryClient;

  TripRemoteDatasource(this.ferryClient);

  // ---------------------------------------------------------------------------
  // Queries
  // ---------------------------------------------------------------------------

  /// Récupère la liste de tous les trips (champs de base uniquement,
  /// sans waypoints ni segments).
  Future<GGetAllTripBundlesData> getAllTrips() async {
    final data = await ferryClient.execute(
      GGetAllTripBundlesReq(fetchPolicy: FetchPolicy.NetworkOnly),
    );

    return data;
  }

  Future<GGetMeTripsSummaryData> getMeTrips() async {
    final data = await ferryClient.execute(
      GGetMeTripsSummaryReq(fetchPolicy: FetchPolicy.NetworkOnly),
    );
    return data;
  }

  Future<List<GTripSummaryData>> getUserTrips(UserId id) async {
    final data = await ferryClient.execute(
      GGetUserTripsSummaryReq(vars: GGetUserTripsSummaryVars(id: id.value)),
    );
    return data.userTrips;
  }

  /// Récupère un trip complet (avec waypoints et segments) par son [id].
  Future<GTripSummaryData> getTripSummary({required TripId tripId}) async {
    final data = await ferryClient.execute(
      GGetTripSummaryReq(vars: GGetTripSummaryVars(id: tripId.value)),
    );
    return data.trip;
  }

  Future<GTripFullData> getTripBundle({required TripId tripId}) async {
    final data = await ferryClient.execute(
      GGetTripBundleReq(vars: GGetTripBundleVars(id: tripId.value)),
    );

    return data.trip;
  }
  // ---------------------------------------------------------------------------
  // Mutations
  // ---------------------------------------------------------------------------

  Future<GTripSummary> createBlankTrip(LatLng latLng) async {
    final data = await ferryClient.execute(
      GCreateBlankTripReq(
        vars: GCreateBlankTripVars(origin: Value.present(latLng.toGQLInput())),
      ),
    );
    return data.createBlankTrip;
  }

  /// Met à jour un trip existant identifié par [id] avec les données fournies
  /// dans [input]. Retourne le trip mis à jour (avec waypoints et segments).
  Future<GTripSummary> updateTrip({
    required Id<Trip> id,
    required GTripUpdateInput input,
  }) async {
    final data = await ferryClient.execute(
      GUpdateTripReq(
        vars: GUpdateTripVars(id: id.value, input: input),
      ),
    );

    return data.updateTrip;
  }

  /// Supprime le trip identifié par [id].
  Future<void> deleteTrip({required Id<Trip> id}) async {
    await ferryClient.execute(
      GDeleteTripReq(vars: GDeleteTripVars(id: id.value)),
    );
  }

  Future<GEditRouteResult> setTripOrigin({
    required Id<Trip> id,
    required LatLng origin,
  }) async {
    final data = await ferryClient.execute(
      GSetTripOriginReq(
        vars: GSetTripOriginVars(id: id.value, origin: origin.toGQLInput()),
      ),
    );
    return data.setTripOrigin;
  }
}
