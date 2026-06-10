import 'package:vamos_cartographie/features/features.dart';
import 'package:vamos_cartographie/graphql/graphql.dart';
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
    required int tripId,
    required LatLng latLng,
  }) async {
    final req = GCreateVertexReq(
      vars: GCreateVertexVars(
        tripId: tripId,
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
    required int vertexId,
    required LatLng latLng,
  }) async {
    final req = GMoveVertexReq(
      vars: GMoveVertexVars(
        id: vertexId,
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

  Future<List<GWaypointFields>> getWaypoints({required int tripId}) async {
    final req = GGetWaypointsReq(vars: GGetWaypointsVars(tripId: tripId));
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
    required int tripId,
    required GWaypointCreateInput input,
  }) async {
    final req = GCreateWaypointReq(
      vars: GCreateWaypointVars(tripId: tripId, waypoint: input),
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

  Future<void> deleteWaypoint({required int id}) async {
    final req = GDeleteWaypointReq(vars: GDeleteWaypointVars(waypointId: id));
    final response = await client.request(req).first;
    if (response.hasErrors || response.data == null) {
      throw Exception(
        response.graphqlErrors?.first.message ??
            'Erreur lors de la suppression du waypoint',
      );
    }
  }

  Future<void> attachImageToWaypoint({
    required int waypointId,
    required String fileKey,
  }) async {
    final req = GAttachImageToWaypointReq(
      vars: GAttachImageToWaypointVars(
        waypointId: waypointId,
        fileKey: fileKey,
      ),
    );
    final response = await client.request(req).first;
    if (response.hasErrors || response.data == null) {
      throw Exception(
        response.graphqlErrors?.first.message ??
            'Erreur lors de l\'association de l\'image au waypoint',
      );
    }
  }

  Future<void> deleteImgFromWaypoint({
    required int waypointId,
    required String fileKey,
  }) async {
    final req = GDeleteImageFromWaypointReq(
      vars: GDeleteImageFromWaypointVars(
        waypointId: waypointId,
        fileKey: fileKey,
      ),
    );
    final response = await client.request(req).first;
    if (response.hasErrors || response.data == null) {
      throw Exception(
        response.graphqlErrors?.first.message ??
            "Erreur lors de la suppression de l'image waypoint",
      );
    }
  }
}
