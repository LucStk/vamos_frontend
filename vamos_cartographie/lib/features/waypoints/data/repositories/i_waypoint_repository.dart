import 'package:dartz/dartz.dart';
import 'package:vamos_cartographie/core/failure.dart';
import 'package:vamos_cartographie/features/waypoints/domain/domain.dart';

// import 'dart:io';

abstract class IWaypointRepository {
  Future<Either<Failure, List<Waypoint>>> getWaypoints(int tripId);
  Future<Either<Failure, Waypoint>> createWaypoint(
    int tripId,
    WaypointDraft waypoint,
  );
  Future<Either<Failure, Waypoint>> updateWaypoint(
    int id,
    int currentVertexId,
    WaypointDraft waypoint,
  );
  Future<Either<Failure, void>> deleteWaypoint(int id);
}
