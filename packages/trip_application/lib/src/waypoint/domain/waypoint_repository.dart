import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';
import 'package:latlong2/latlong.dart';
import 'package:trip_application/src/trip/domain/trip.dart';
import 'package:trip_application/src/waypoint/domain/domain.dart';
import 'package:trip_application/src/waypoint/domain/waypoint_payload.dart';

abstract class WaypointRepository {
  Future<Either<Failure, WaypointRemoteModel>> createBlankWaypoint({
    required TripId tripId,
    required LatLng latLng,
  });

  Future<Either<Failure, Iterable<WaypointPayload>>> getWaypoints(TripId id);
  Future<Either<Failure, WaypointRemoteModel>> updateWaypoint(
    WaypointRemoteModel waypoint,
  );

  Future<Either<Failure, void>> deleteWaypoint(WaypointId id);
}
