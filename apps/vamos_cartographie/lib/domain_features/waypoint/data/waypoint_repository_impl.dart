import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';
import 'package:trip_application/trip_application.dart';
import "package:latlong2/latlong.dart";
import 'package:vamos_cartographie/core/erreur_handler.dart';
import 'package:vamos_cartographie/domain_features/waypoint/waypoint.dart';

class WaypointRepositoryImpl extends WaypointRepository {
  final WaypointRemoteDatasource remote;

  WaypointRepositoryImpl(this.remote);

  @override
  Future<Either<Failure, Iterable<WaypointPayload>>> getWaypoints(
    Id<Trip> tripId,
  ) {
    return guard(() async {
      final waypoints = await remote.getWaypoints(tripId: tripId);
      return waypoints.map(
        (w) => WaypointPayload(waypoint: w.toDomain(), images: w.toImages()),
      );
    });
  }

  @override
  Future<Either<Failure, WaypointRemoteModel>> createBlankWaypoint({
    required TripId tripId,
    required LatLng latLng,
  }) {
    return guard(() async {
      final gqlResult = await remote.createBlankWaypointFromPosition(
        tripId: tripId,
        latLng: latLng,
      );
      return gqlResult.toDomain();
    });
  }

  @override
  Future<Either<Failure, WaypointRemoteModel>> updateWaypoint(
    WaypointFields waypoint,
  ) {
    return guard(() async {
      final input = waypoint.toGQLUpdateInput();
      final gqlResult = await remote.updateWaypoint(
        id: waypoint.id,
        input: input,
      );
      return gqlResult.toDomain();
    });
  }

  @override
  Future<Either<Failure, void>> deleteWaypoint(WaypointId id) {
    return guard(() async {
      await remote.deleteWaypoint(id: id);
    });
  }
}
