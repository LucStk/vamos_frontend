import 'package:dartz/dartz.dart';
import 'package:vamos_cartographie/core/failure.dart';
import 'package:vamos_cartographie/features/waypoints/domain/entities/entities.dart';

// import 'dart:io';

abstract class IWaypointRepository {
  Future<Either<Failure, Waypoint>> updateWaypoint(
    int id,
    WaypointDraft waypoint,
  );
}
