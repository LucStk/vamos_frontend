import 'package:domain_core/domain_core.dart';
import 'package:trip_domain/trip_domain.dart';
import "package:topology_engine/topology_engine.dart";
import 'package:vamos_cartographie/backend/graphql/graphql.dart';
import 'package:ferry/ferry.dart';
import 'package:latlong2/latlong.dart';

/// Datasource distant pour les opérations sur les trips.
/// Communique directement avec le backend via le client Ferry (GraphQL).
/// Retourne des types GQL bruts – c'est le repository qui se charge
/// de les convertir en modèles domaine via [TripMapper].
class WaypointRemoteDatasource {
  final Client client;

  WaypointRemoteDatasource(this.client);

  /// Create a vertex at the given location.
  /// This is typically done before creating a waypoint.
  Future<GVertexFields> createVertex({
    required Id<Trip> tripId,
    required LatLng latLng,
  }) async {
    final req = GCreateVertexReq(
      vars: GCreateVertexVars(
        tripId: tripId.value,
        latLng: GLatLngInput(lat: latLng.latitude, lng: latLng.longitude),
      ),
    );
    final response = await client.request(req).first;
    if (response.hasErrors || response.data == null) {
      throw Exception(
        response.graphqlErrors?.first.message ??
            'Erreur dans la création du vertex',
      );
    }
    return response.data!.createVertex;
  }

  /// Move a vertex to a new location.
  /// This is typically used when updating a waypoint's position.
  Future<GVertexFields> moveVertex({
    required Id<Vertex> vertexId,
    required LatLng latLng,
  }) async {
    final req = GMoveVertexReq(
      vars: GMoveVertexVars(
        id: vertexId.value,
        latLng: GLatLngInput(lat: latLng.latitude, lng: latLng.longitude),
      ),
    );
    final response = await client.request(req).first;
    if (response.hasErrors || response.data == null) {
      throw Exception(
        response.graphqlErrors?.first.message ??
            'Erreur lors du déplacement du vertex',
      );
    }
    return response.data!.moveVertex;
  }

  Future<List<GWaypointFields>> getWaypoints({required Id<Trip> tripId}) async {
    final req = GGetWaypointsReq(vars: GGetWaypointsVars(tripId: tripId.value));
    final response = await client.request(req).first;

    if (response.hasErrors || response.data == null) {
      throw Exception(
        response.graphqlErrors?.first.message ??
            'Erreur dans le get des waypoints du trip',
      );
    }
    return response.data!.trip.waypoints;
  }

  Future<GCreateWaypointPayloadFields> createWaypoint({
    required Id<Trip> tripId,
    required GWaypointCreateInput input,
  }) async {
    final req = GCreateWaypointReq(
      vars: GCreateWaypointVars(tripId: tripId.value, waypoint: input),
    );
    final response = await client.request(req).first;
    if (response.hasErrors || response.data == null) {
      throw Exception(
        response.graphqlErrors?.first.message ??
            'Erreur dans la création du waypoint',
      );
    }
    return response.data!.createWaypoint;
  }

  Future<GWaypointFields> updateWaypoint({
    required Id<Waypoint> id,
    required GWaypointUpdateInput input,
  }) async {
    final req = GUpdateWaypointReq(
      vars: GUpdateWaypointVars(id: id.value, waypoint: input),
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

  Future<void> deleteWaypoint({required Id<Waypoint> id}) async {
    final req = GDeleteWaypointReq(
      vars: GDeleteWaypointVars(waypointId: id.value),
    );
    final response = await client.request(req).first;
    if (response.hasErrors || response.data == null) {
      throw Exception(
        response.graphqlErrors?.first.message ??
            'Erreur lors de la suppression du waypoint',
      );
    }
  }
}
