import 'package:dartz/dartz.dart';
import 'package:vamos_cartographie/core/failure.dart';
import 'package:vamos_cartographie/domain/domain.dart';

// import 'dart:io';

abstract class IWaypointRepository {
  Future<Either<Failure, Waypoint>> updateWaypoint(int waypointId, int tripId);
}
