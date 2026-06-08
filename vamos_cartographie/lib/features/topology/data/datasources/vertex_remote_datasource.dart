import 'package:vamos_cartographie/graphql/graphql.dart';
import 'package:ferry/ferry.dart';

/// Datasource distant pour les opérations sur les trips.
/// Communique directement avec le backend via le client Ferry (GraphQL).
/// Retourne des types GQL bruts – c'est le repository qui se charge
/// de les convertir en modèles domaine via [TripMapper].
class VertexRemoteDatasource {
  final Client client;

  VertexRemoteDatasource(this.client);

  Future<List<GVertexFields>> getVertices({required int tripId}) async {
    final req = GGetVerticesReq(vars: GGetVerticesVars(tripId: tripId));
    final response = await client.request(req).first;

    if (response.hasErrors || response.data == null) {
      throw Exception(
        response.graphqlErrors?.first.message ??
            'Erreur dans le get des vertex du trip',
      );
    }
    return response.data!.trip.topology.vertices;
  }

  Future<GVertexFields> createVertex({
    required int tripId,
    required GLatLngInput latLng,
  }) async {
    final req = GCreateVertexReq(
      vars: GCreateVertexVars(tripId: tripId, latLng: latLng),
    );
    final response = await client.request(req).first;
    if (response.hasErrors || response.data == null) {
      throw Exception(
        response.graphqlErrors?.first.message ??
            'Erreur dans la création du waypoint',
      );
    }
    return response.data!.createVertex;
  }

  Future<GVertexFields> moveVertex({
    required int id,
    required GLatLngInput latLng,
  }) async {
    final req = GMoveVertexReq(
      vars: GMoveVertexVars(id: id, latLng: latLng),
    );
    final response = await client.request(req).first;
    if (response.hasErrors || response.data == null) {
      throw Exception(
        response.graphqlErrors?.first.message ??
            'Erreur lors de la mise à jour du Segment',
      );
    }
    return response.data!.moveVertex;
  }

  Future<void> deleteVertex({required int id}) async {
    final req = GDeleteVertexReq(vars: GDeleteVertexVars(vertexId: id));
    final response = await client.request(req).first;
    if (response.hasErrors || response.data == null) {
      throw Exception(
        response.graphqlErrors?.first.message ??
            'Erreur lors de la suppression du waypoint',
      );
    }
  }
}
