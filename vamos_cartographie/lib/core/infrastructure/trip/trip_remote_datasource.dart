import 'package:vamos_cartographie/core/network/network.dart';

import '/core/graphql/graphql.dart';
import 'package:ferry/ferry.dart';
import 'package:domain_core/domain_core.dart';
import 'package:trip_domain/trip_domain.dart';

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
  Future<List<GTripFieldsData>> getAllTrips() async {
    final data = await ferryClient.execute(
      GGetAllTripsReq(fetchPolicy: FetchPolicy.NetworkOnly),
    );

    return data.trips;
  }

  /// Récupère un trip complet (avec waypoints et segments) par son [id].
  Future<GTripFieldsData> getTripById({required Id<Trip> id}) async {
    final data = await ferryClient.execute(
      GGetTripReq(vars: GGetTripVars(id: id.value)),
    );

    return data.trip;
  }

  // ---------------------------------------------------------------------------
  // Mutations
  // ---------------------------------------------------------------------------

  // /// Crée un nouveau trip à partir d'un [GTripInput] et retourne les données
  // /// complètes du trip créé (avec waypoints et segments).
  // Future<GTripFields> createTrip({required GTripInput input}) async {
  //   final req = GCreateTripReq(vars: GCreateTripVars(trip: input));
  //   final response = await ferryClient.request(req).first;
  //   if (response.hasErrors || response.data == null) {
  //     throw Exception(
  //       response.graphqlErrors?.first.message ??
  //           'Erreur lors de la création du trip',
  //     );
  //   }
  //   return response.data!.createTrip;
  // }
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
