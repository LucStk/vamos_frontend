import 'package:user_profile_application/user_profile_application.dart';

import '/core/network/ferry_client_x.dart';
import '/core/graphql/graphql.dart';
import 'package:ferry/ferry.dart';
import 'package:domain_core/domain_core.dart';
import 'package:trip_application/trip_application.dart';

import 'graphql/graphql.dart';

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
  Future<GGetAllTripsData> getAllTrips() async {
    final data = await ferryClient.execute(
      GGetAllTripsReq(fetchPolicy: FetchPolicy.NetworkOnly),
    );

    return data;
  }

  Future<GGetMeTripsData> getMeTrips() async {
    final data = await ferryClient.execute(
      GGetMeTripsReq(fetchPolicy: FetchPolicy.NetworkOnly),
    );
    return data;
  }

  Future<GGetUserTripsData> getUserTrips(UserId id) async {
    final data = await ferryClient.execute(
      GGetUserTripsReq(vars: GGetUserTripsVars(id: id.value)),
    );
    return data;
  }

  /// Récupère un trip complet (avec waypoints et segments) par son [id].
  Future<GTripFieldsData> getTripById({required Id<Trip> id}) async {
    final data = await ferryClient.execute(
      GGetTripReq(vars: GGetTripVars(id: id.value)),
    );
    return data.trip;
  }

  Future<GGetTripDetailsData_trip> getTripDetails({
    required Id<Trip> id,
  }) async {
    final data = await ferryClient.execute(
      GGetTripDetailsReq(vars: GGetTripDetailsVars(id: id.value)),
    );

    return data.trip;
  }
  // ---------------------------------------------------------------------------
  // Mutations
  // ---------------------------------------------------------------------------

  Future<GTripFields> createBlankTrip() async {
    final data = await ferryClient.execute(GCreateBlankTripReq());
    return data.createBlankTrip;
  }

  /// Met à jour un trip existant identifié par [id] avec les données fournies
  /// dans [input]. Retourne le trip mis à jour (avec waypoints et segments).
  Future<GTripFields> updateTrip({
    required Id<Trip> id,
    required GTripUpdateInput input,
  }) async {
    final data = await ferryClient.execute(
      GUpdateTripReq(
        vars: GUpdateTripVars(id: id.value, trip: input),
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
}
