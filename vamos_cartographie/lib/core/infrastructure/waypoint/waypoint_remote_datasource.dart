import 'package:domain_core/domain_core.dart';
import 'package:trip_domain/trip_domain.dart';
import 'package:vamos_cartographie/core/network/network.dart';
import '/core/graphql/graphql.dart';
import 'package:ferry/ferry.dart';
import 'package:latlong2/latlong.dart';

/// Datasource distant pour les opérations sur les trips.
/// Communique directement avec le backend via le ferryClient Ferry (GraphQL).
/// Retourne des types GQL bruts – c'est le repository qui se charge
/// de les convertir en modèles domaine via [TripMapper].
class WaypointRemoteDatasource {
  final Client ferryClient;

  WaypointRemoteDatasource(this.ferryClient);

  /// Create a vertex at the given location.
  /// This is typically done before creating a waypoint.
  Future<GVertexFields> createVertex({
    required Id<Trip> tripId,
    required LatLng latLng,
  }) async {
    final data = await ferryClient.execute(
      GCreateVertexReq(
        vars: GCreateVertexVars(
          tripId: tripId.value,
          latLng: GLatLngInput(lat: latLng.latitude, lng: latLng.longitude),
        ),
      ),
    );
    return data.createVertex;
  }

  /// Move a vertex to a new location.
  /// This is typically used when updating a waypoint's position.
  Future<GVertexFields> moveVertex({
    required Id<Vertex> vertexId,
    required LatLng latLng,
  }) async {
    final data = await ferryClient.execute(
      GMoveVertexReq(
        vars: GMoveVertexVars(
          id: vertexId.value,
          latLng: GLatLngInput(lat: latLng.latitude, lng: latLng.longitude),
        ),
      ),
    );
    return data.moveVertex;
  }

  Future<List<GWaypointFields>> getWaypoints({required Id<Trip> tripId}) async {
    final data = await ferryClient.execute(
      GGetWaypointsReq(vars: GGetWaypointsVars(tripId: tripId.value)),
    );
    return data.trip.waypoints;
  }

  Future<GCreateWaypointPayloadFields> createBlankWaypoint({
    required Id<Trip> tripId,
    LatLng? latLng,
    VertexId? vertexId,
  }) async {
    if (latLng == null && vertexId == null) {
      throw Exception("LatLng et VertexId shouldn't be null at the same time");
    }
    late dynamic req;
    if (vertexId != null) {
      req = GCreateBlankWaypointFromVertexReq(
        vars: GCreateBlankWaypointFromVertexVars(
          tripId: tripId.value,
          vertexId: vertexId as String,
        ),
      );
    } else {
      req = GCreateBlankWaypointFromPositionReq(
        vars: GCreateBlankWaypointFromPositionVars(
          tripId: tripId.value,
          latLng: GLatLngInput(lat: latLng!.latitude, lng: latLng.longitude),
        ),
      );
    }

    final data = await ferryClient.execute(req);
    return data.createWaypoint;
  }

  Future<GWaypointFields> updateWaypoint({
    required Id<Waypoint> id,
    required GWaypointUpdateInput input,
  }) async {
    final data = await ferryClient.execute(
      GUpdateWaypointReq(
        vars: GUpdateWaypointVars(id: id.value, waypoint: input),
      ),
    );
    return data.updateWaypoint;
  }

  Future<void> deleteWaypoint({required Id<Waypoint> id}) async {
    await ferryClient.execute(
      GDeleteWaypointReq(vars: GDeleteWaypointVars(waypointId: id.value)),
    );
  }
}
