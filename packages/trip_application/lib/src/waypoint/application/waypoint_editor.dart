import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';
import 'package:latlong2/latlong.dart';
import 'package:trip_application/src/trip/domain/trip.dart';
import 'package:trip_application/src/waypoint/application/application.dart';
import 'package:trip_application/src/waypoint/domain/domain.dart';

mixin WaypointEditor on OptimisticRunner<WaypointStore> {
  WaypointRepository get waypointRepo;
  TripId get tripId;
  Future<Either<Failure, WaypointRemoteModel>> createBlankWaypoint(
    LatLng latLng,
  ) async {
    return await run(
      onApply: (gs) => gs,
      remote: (_) =>
          waypointRepo.createBlankWaypoint(tripId: tripId, latLng: latLng),
      onSuccess: (gs, WaypointRemoteModel serveurValue) =>
          gs.insertWaypoint(serveurValue),
    );
  }

  void patchWaypointPosition(WaypointId waypointId, LatLng latLng) {
    final w = state.waypointStore.getRequired(waypointId);
    final patch = WaypointPatchModel.fromFields(
      w.current,
    ).copyWith(position: latLng);
    state = state.setWaypoint(patch);
  }

  void patchWaypointAnchorPosition(WaypointId waypointId, double position) {
    final w = state.waypointStore.getRequired(waypointId);
    final patch = WaypointPatchModel.fromFields(
      w.current,
    ).copyWith(anchorPosition: position);
    state = state.setWaypoint(patch);
  }

  Future<Either<Failure, WaypointRemoteModel>> updateDescription(
    WaypointFields current,
    String description,
  ) => updateWaypoint(
    WaypointPatchModel.fromFields(current).copyWith(description: description),
  );
  Future<Either<Failure, WaypointRemoteModel>> updateTitle(
    WaypointFields current,
    String title,
  ) => updateWaypoint(
    WaypointPatchModel.fromFields(current).copyWith(title: title),
  );
  Future<Either<Failure, WaypointRemoteModel>> updateWaypoint(
    WaypointFields waypoint,
  ) async {
    final server = state.waypointStore.get(waypoint.id)?.serverValue;
    final changes = WaypointChanges.between(server, waypoint);

    if (changes.isEmpty && server is WaypointRemoteModel) {
      return Right(server);
    }

    return await run(
      entityKey: waypoint.id,
      onApply: (gs) => gs.setWaypoint(waypoint),
      remote: (_) => waypointRepo.updateWaypoint(waypoint, changes),
      onSuccess: (gs, serverValue) => gs.setWaypoint(serverValue),
      onError: (gs, Failure failure) => gs.rollbackWaypoint(waypoint.id),
    );
  }

  Future<Either<Failure, WaypointRemoteModel>> commitWaypoint(
    WaypointId waypointId,
  ) async {
    return await run(
      entityKey: waypointId,
      onApply: (gs) => gs,
      remote: (_) {
        // Lu au moment de l'appel : `current` est un Patch, donc lastRemoteValue
        // est intact et le diff est fiable.
        final node = state.waypointStore.getRequired(waypointId);
        return waypointRepo.updateWaypoint(
          node.current,
          WaypointChanges.between(node.serverValue, node.current),
        );
      },
      onSuccess: (gs, serveurValue) => gs.setWaypoint(serveurValue),
      onError: (gs, Failure failure) => gs.rollbackWaypoint(waypointId),
    );
  }

  Future<Either<Failure, void>> deleteWaypoint(WaypointId id) async {
    return await run(
      entityKey: id,
      onApply: (gs) => gs,
      remote: (_) => waypointRepo.deleteWaypoint(id),
      onSuccess: (gs, _) => gs.removeWaypoint(id),
    );
  }
}
