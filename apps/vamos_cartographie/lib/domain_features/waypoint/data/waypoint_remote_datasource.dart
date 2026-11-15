import 'package:domain_core/domain_core.dart';
import 'package:gql_tristate_value/gql_tristate_value.dart';
import 'package:trip_application/trip_application.dart';
import 'package:ferry/ferry.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/core/graphql/graphql.dart';
import 'package:vamos_cartographie/core/network/ferry_client_x.dart';
import 'package:vamos_cartographie/domain_features/waypoint/waypoint.dart';
import 'package:vamos_cartographie/domain_features/waypoint/data/graphql/graphql.dart';

/// Datasource distant pour les opérations sur les trips.
/// Communique directement avec le backend via le ferryClient Ferry (GraphQL).
/// Retourne des types GQL bruts – c'est le repository qui se charge
/// de les convertir en modèles domaine via [TripMapper].
class WaypointRemoteDatasource {
  final Client ferryClient;

  WaypointRemoteDatasource(this.ferryClient);

  Future<GWaypointDetails> createBlankWaypointFromPosition({
    required Id<Trip> tripId,
    required LatLng latLng,
  }) async {
    final data = await ferryClient.execute(
      GCreateBlankWaypointFromPositionReq(
        vars: GCreateBlankWaypointFromPositionVars(
          tripId: tripId.value,
          latLng: GLatLngInput(lat: latLng.latitude, lng: latLng.longitude),
        ),
      ),
    );
    return data.createBlankWaypointFromPosition;
  }

  Future<GWaypointDetails> updateWaypoint({
    required WaypointId id,
    required GWaypointUpdateInput input,
  }) async {
    final data = await ferryClient.execute(
      GUpdateWaypointReq(
        vars: GUpdateWaypointVars(id: id.value, waypoint: input),
      ),
    );
    return data.updateWaypoint;
  }

  Future<void> deleteWaypoint({required WaypointId id}) async {
    await ferryClient.execute(
      GDeleteWaypointReq(vars: GDeleteWaypointVars(id: id.value)),
    );
  }

  Future<GWaypointDetails> setStay({
    required WaypointId waypointId,
    required int nights,
  }) async {
    final data = await ferryClient.execute(
      GSetStayReq(
        vars: GSetStayVars(waypointId: waypointId.value, nights: nights),
      ),
    );
    return data.setStay;
  }

  Future<GWaypointDetails> clearStay({required WaypointId waypointId}) async {
    final data = await ferryClient.execute(
      GClearStayReq(vars: GClearStayVars(waypointId: waypointId.value)),
    );
    return data.clearStay;
  }

  /// Renvoie null si la note a été supprimée (titre et notes vides).
  Future<GDayNoteDetails?> setStayDayNote({
    required Id<Trip> tripId,
    required StayId stayId,
    required int offset,
    required String title,
    required String notes,
  }) => _setDayNote(tripId, Value.present(stayId.value), offset, title, notes);

  Future<GDayNoteDetails?> setFinalDayNote({
    required Id<Trip> tripId,
    required String title,
    required String notes,
  }) => _setDayNote(tripId, Value.present(null), 0, title, notes);

  Future<GDayNoteDetails?> _setDayNote(
    Id<Trip> tripId,
    Value<String> stayId,
    int offset,
    String title,
    String notes,
  ) async {
    final data = await ferryClient.execute(
      GSetDayNoteReq(
        vars: GSetDayNoteVars(
          tripId: tripId.value,
          stayId: stayId,
          offset: offset,
          title: title,
          notes: notes,
        ),
      ),
    );
    return data.setDayNote;
  }

  Future<GDayNoteDetails?> finalDayNote({required Id<Trip> tripId}) async {
    final data = await ferryClient.execute(
      GFinalDayNoteReq(vars: GFinalDayNoteVars(tripId: tripId.value)),
    );
    return data.finalDayNote;
  }
}
