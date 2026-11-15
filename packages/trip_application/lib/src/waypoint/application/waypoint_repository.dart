import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';
import 'package:latlong2/latlong.dart';
import 'package:trip_application/src/trip/domain/trip.dart';
import 'package:trip_application/src/waypoint/domain/domain.dart';

abstract class WaypointRepository {
  Future<Either<Failure, WaypointRemoteModel>> createBlankWaypoint({
    required TripId tripId,
    required LatLng latLng,
  });

  // Future<Either<Failure, Iterable<WaypointPayload>>> getWaypoints(TripId id);
  Future<Either<Failure, WaypointRemoteModel>> updateWaypoint(
    WaypointFields waypoint,
    WaypointChanges changes,
  );

  Future<Either<Failure, void>> deleteWaypoint(WaypointId id);
  Future<Either<Failure, WaypointRemoteModel>> setStay(
    WaypointId waypointId,
    int nights,
  );
  Future<Either<Failure, WaypointRemoteModel>> clearStay(WaypointId waypointId);
  Future<Either<Failure, DayNote?>> setDayNote({
    required Id<Trip> tripId,
    required StayId stayId,
    required int offset,
    required String title,
    required String notes,
  });
  Future<Either<Failure, DayNote?>> setFinalDayNote({
    required Id<Trip> tripId,
    required int offset,
    required String title,
    required String notes,
  });
  Future<Either<Failure, DayNote?>> finalDayNote(Id<Trip> tripId);
}
