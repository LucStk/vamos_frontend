import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';
import 'package:latlong2/latlong.dart';
import 'package:trip_domain/domain/entities/entities.dart';
import 'package:trip_domain/domain/types/Ids.dart';

abstract class WaypointRepository {
  Future<Either<Failure, List<Waypoint>>> getWaypoints(TripId id);
  Future<Either<Failure, (Waypoint, Vertex)>> createWaypoint(
    TripId tripId,
    WaypointDraft waypointDraft,
    VertexId? vertexId,
    LatLng? latLng,
  );
  Future<Either<Failure, Waypoint>> updateWaypoint(
    WaypointId id,
    WaypointDraft waypoint,
  );
  Future<Either<Failure, void>> deleteWaypoint(WaypointId id);
}
