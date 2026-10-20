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

  Future<Either<Failure, WaypointRemoteModel>> updateWaypoint(
    WaypointFields waypoint,
  ) async {
    return await run(
      entityKey: waypoint.id,
      onApply: (gs) => gs.setWaypoint(waypoint),
      remote: (_) =>
          waypointRepo.updateWaypoint(WaypointRemoteModel.fromFields(waypoint)),
      onSuccess: (gs, serveurValue) => gs.setWaypoint(serveurValue),
      onError: (gs, Failure failure) => gs.rollbackWaypoint(waypoint.id),
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
