import 'package:vamos_cartographie/backend/graphql/graphql.dart';
import 'package:ferry/ferry.dart';
import 'package:topology_engine/domain/entities/vertex.dart';
import "package:vamos_cartographie/core/core.dart";
import 'package:vamos_cartographie/features/trips/domain/trip.dart';

/// Datasource distant pour les opérations sur les trips.
/// Communique directement avec le backend via le client Ferry (GraphQL).
/// Retourne des types GQL bruts – c'est le repository qui se charge
/// de les convertir en modèles domaine via [TripMapper].
class VertexRemoteDatasource {
  final Client client;

  VertexRemoteDatasource(this.client);

  Future<List<GVertexFields>> getVertices({required Id<Trip> tripId}) async {
    final req = GGetVerticesReq(vars: GGetVerticesVars(tripId: tripId.value));
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
    required Id<Trip> tripId,
    required GLatLngInput latLng,
  }) async {
    final req = GCreateVertexReq(
      vars: GCreateVertexVars(tripId: tripId.value, latLng: latLng),
    );
    final response = await client.request(req).first;
    if (response.hasErrors || response.data == null) {
      throw Exception(
        response.graphqlErrors?.first.message ??
            'Erreur dans la création du waypoId<Vertex>',
      );
    }
    return response.data!.createVertex;
  }

  Future<GVertexFields> moveVertex({
    required Id<Vertex> id,
    required GLatLngInput latLng,
  }) async {
    final req = GMoveVertexReq(
      vars: GMoveVertexVars(id: id.value, latLng: latLng),
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

  Future<void> deleteVertex({required Id<Vertex> id}) async {
    final req = GDeleteVertexReq(vars: GDeleteVertexVars(vertexId: id.value));
    final response = await client.request(req).first;
    if (response.hasErrors || response.data == null) {
      throw Exception(
        response.graphqlErrors?.first.message ??
            'Erreur lors de la suppression du waypoId<Vertex>',
      );
    }
  }
}
