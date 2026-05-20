import 'package:api_client/api_client.dart';
import 'package:ferry/ferry.dart';

/// Datasource distant pour les opérations sur les trips.
/// Communique directement avec le backend via le client Ferry (GraphQL).
/// Retourne des types GQL bruts – c'est le repository qui se charge
/// de les convertir en modèles domaine via [TripMapper].
class TripRemoteDatasource {
  final Client client;

  TripRemoteDatasource(this.client);

  // ---------------------------------------------------------------------------
  // Queries
  // ---------------------------------------------------------------------------

  /// Récupère la liste de tous les trips (champs de base uniquement,
  /// sans waypoints ni segments).
  Future<List<GTripFieldsData>> getAllTrips() async {
    final req = GGetAllTripsReq(fetchPolicy: FetchPolicy.NetworkOnly);
    final response = await client.request(req).first;
    if (response.hasErrors || response.data == null) {
      throw Exception(
        response.graphqlErrors?.first.message ??
            'Erreur lors du chargement des trips',
      );
    }
    return response.data!.trips;
  }

  /// Récupère un trip complet (avec waypoints et segments) par son [id].
  Future<GGetTripData_trip> getTripById({required int id}) async {
    final req = GGetTripReq(vars: GGetTripVars(id: id));
    final response = await client.request(req).first;
    if (response.hasErrors || response.data == null) {
      throw Exception(
        response.graphqlErrors?.first.message ?? 'Trip introuvable (id: $id)',
      );
    }
    return response.data!.trip;
  }

  // ---------------------------------------------------------------------------
  // Mutations
  // ---------------------------------------------------------------------------

  /// Crée un nouveau trip à partir d'un [GTripInput] et retourne les données
  /// complètes du trip créé (avec waypoints et segments).
  Future<GCreateTripData_createTrip> createTrip({
    required GTripInput input,
  }) async {
    final req = GCreateTripReq(vars: GCreateTripVars(trip: input));
    final response = await client.request(req).first;
    if (response.hasErrors || response.data == null) {
      throw Exception(
        response.graphqlErrors?.first.message ??
            'Erreur lors de la création du trip',
      );
    }
    return response.data!.createTrip;
  }

  /// Met à jour un trip existant identifié par [id] avec les données fournies
  /// dans [input]. Retourne le trip mis à jour (avec waypoints et segments).
  Future<GUpdateTripData_updateTrip> updateTrip({
    required int id,
    required GTripUpdateInput input,
  }) async {
    final req = GUpdateTripReq(
      vars: GUpdateTripVars(id: id, trip: input),
    );
    final response = await client.request(req).first;
    if (response.hasErrors || response.data == null) {
      throw Exception(
        response.graphqlErrors?.first.message ??
            'Erreur lors de la mise à jour du trip',
      );
    }
    return response.data!.updateTrip;
  }

  /// Supprime le trip identifié par [id].
  Future<void> deleteTrip({required int id}) async {
    final req = GDeleteTripReq(vars: GDeleteTripVars(id: id));
    final response = await client.request(req).first;
    if (response.hasErrors || response.data == null) {
      throw Exception(
        response.graphqlErrors?.first.message ??
            'Erreur lors de la suppression du trip',
      );
    }
  }
}
