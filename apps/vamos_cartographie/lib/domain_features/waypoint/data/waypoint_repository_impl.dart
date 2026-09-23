import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';
import 'package:trip_application/trip_application.dart';
import "package:latlong2/latlong.dart";

import 'package:vamos_cartographie/core/core.dart';
import 'package:vamos_cartographie/domain_features/domain_features.dart';

class WaypointRepositoryImpl extends WaypointRepository {
  final WaypointRemoteDatasource remote;

  WaypointRepositoryImpl(this.remote);

  @override
  Future<Either<Failure, List<WaypointRemoteModel>>> getWaypoints(
    Id<Trip> tripId,
  ) {
    return guard(() async {
      final waypoints = await remote.getWaypoints(tripId: tripId);
      return waypoints.map((w) => w.toDomain()).toList();
    });
  }

  @override
  Future<Either<Failure, WaypointCreateBlankRes>>
  createBlankWaypointFromPosition(Id<Trip> tripId, LatLng latLng) {
    return guard(() async {
      final gqlResult = await remote.createBlankWaypointFromPosition(
        tripId: tripId,
        latLng: latLng,
      );
      final createWaypoint = gqlResult.waypoint.toDomain();
      final waypointVertex = gqlResult.vertex.toDomain();
      return WaypointCreateBlankRes(createWaypoint, waypointVertex);
    });
  }

  @override
  Future<Either<Failure, WaypointCreateBlankRes>> createBlankWaypointFromVertex(
    Id<Trip> tripId,
    VertexId vertexId,
  ) {
    return guard(() async {
      final gqlResult = await remote.createBlankWaypointFromVertex(
        tripId: tripId,
        vertexId: vertexId,
      );
      final createWaypoint = gqlResult.waypoint.toDomain();
      final waypointVertex = gqlResult.vertex.toDomain();
      return WaypointCreateBlankRes(createWaypoint, waypointVertex);
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
