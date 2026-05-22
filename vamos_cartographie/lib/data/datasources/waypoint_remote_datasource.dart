import 'package:api_client/api_client.dart';
import 'package:ferry/ferry.dart';

/// Datasource distant pour les opérations sur les trips.
/// Communique directement avec le backend via le client Ferry (GraphQL).
/// Retourne des types GQL bruts – c'est le repository qui se charge
/// de les convertir en modèles domaine via [TripMapper].
class WaypointRemoteDatasource {
  final Client client;

  WaypointRemoteDatasource(this.client);

  Future<GWaypointFields> updateWaypoint({
    required int id,
    required GWaypointUpdateInput input,
  }) async {
    final req = GUpdateWaypointReq(
      vars: GUpdateWaypointVars(id: id, waypoint: input),
    );
    final response = await client.request(req).first;
    if (response.hasErrors || response.data == null) {
      throw Exception(
        response.graphqlErrors?.first.message ??
            'Erreur lors de la mise à jour du Waypoint',
      );
    }
    return response.data!.updateWaypoint;
  }
}
