import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';
import 'package:latlong2/latlong.dart';
import 'package:trip_domain/domain/entities/entities.dart';
import 'package:trip_domain/domain/types/Ids.dart';
import 'package:trip_domain/domain/types/topology_res.dart';

abstract class WaypointRepository {
  Future<Either<Failure, List<Waypoint>>> getWaypoints(TripId id);
  Future<Either<Failure, WaypointCreateBlankRes>> createBlankWaypoint(
    TripId tripId,
    VertexId? vertexId,
    LatLng? latLng,
  );
  Future<Either<Failure, Waypoint>> updateWaypoint(Waypoint waypoint);
  Future<Either<Failure, void>> deleteWaypoint(WaypointId id);
}
