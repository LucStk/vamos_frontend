import 'package:vamos_cartographie/core/network/network.dart';
import 'package:vamos_cartographie/topology/data/graphql/fields/__generated__/vertex_fields.data.gql.dart';
import 'package:vamos_cartographie/topology/data/graphql/mutation/__generated__/vertex_mutations.req.gql.dart';
import 'package:vamos_cartographie/topology/data/graphql/mutation/__generated__/vertex_mutations.var.gql.dart';
import 'package:vamos_cartographie/topology/data/graphql/queries/__generated__/vertex_queries.req.gql.dart';
import 'package:vamos_cartographie/topology/data/graphql/queries/__generated__/vertex_queries.var.gql.dart';

import '/core/graphql/graphql.dart';
import 'package:ferry/ferry.dart';
import 'package:domain_core/domain_core.dart';

import 'package:trip_application/trip_application.dart';

/// Datasource distant pour les opérations sur les trips.
/// Communique directement avec le backend via le ferryClient Ferry (GraphQL).
/// Retourne des types GQL bruts – c'est le repository qui se charge
/// de les convertir en modèles domaine via [TripMapper].
class VertexRemoteDatasource {
  final Client ferryClient;

  VertexRemoteDatasource(this.ferryClient);

  Future<List<GVertexFields>> getVertices({required Id<Trip> tripId}) async {
    final data = await ferryClient.execute(
      GGetVerticesReq(vars: GGetVerticesVars(tripId: tripId.value)),
    );

    return data.trip.topology.vertices;
  }

  Future<GVertexFields> createVertex({
    required Id<Trip> tripId,
    required GLatLngInput latLng,
  }) async {
    final data = await ferryClient.execute(
      GCreateVertexReq(
        vars: GCreateVertexVars(tripId: tripId.value, latLng: latLng),
      ),
    );

    return data.createVertex;
  }

  Future<GVertexFields> moveVertex({
    required Id<Vertex> id,
    required GLatLngInput latLng,
  }) async {
    final data = await ferryClient.execute(
      GMoveVertexReq(
        vars: GMoveVertexVars(id: id.value, latLng: latLng),
      ),
    );

    return data.moveVertex;
  }

  Future<void> deleteVertex({required Id<Vertex> id}) async {
    await ferryClient.execute(
      GDeleteVertexReq(vars: GDeleteVertexVars(vertexId: id.value)),
    );
  }
}
