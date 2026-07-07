import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';
import 'package:trip_domain/domain/types/topology_res.dart';
import 'package:trip_domain/trip_domain.dart';
import 'package:vamos_cartographie/core/erreur_handler.dart';
import 'package:vamos_cartographie/core/infrastructure/waypoint/mappers/mappers.dart';
import '/core/infrastructure/topology/mappers/mappers.dart';
import '/core/infrastructure/waypoint/waypoint_remote_datasource.dart';
import "package:latlong2/latlong.dart";

class WaypointRepositoryImpl extends WaypointRepository {
  final WaypointRemoteDatasource remote;

  WaypointRepositoryImpl(this.remote);

  @override
  Future<Either<Failure, List<Waypoint>>> getWaypoints(Id<Trip> tripId) {
    return guard(() async {
      final waypoints = await remote.getWaypoints(tripId: tripId);
      return waypoints.map((w) => WaypointMapper.fromGQL(w)).toList();
    });
  }

  @override
  Future<Either<Failure, WaypointCreateBlankRes>> createBlankWaypoint(
    Id<Trip> tripId,
    Id<Vertex>? vertexId,
    LatLng? latLng,
  ) {
    return guard(() async {
      final gqlResult = await remote.createBlankWaypoint(
        tripId: tripId,
        vertexId: vertexId,
        latLng: latLng,
      );
      final createWaypoint = WaypointMapper.fromGQL(gqlResult.waypoint);
      final waypointVertex = VertexMapper.fromGQL(gqlResult.vertex);

      return WaypointCreateBlankRes(createWaypoint, waypointVertex);
    });
  }

  @override
  Future<Either<Failure, Waypoint>> updateWaypoint(Waypoint waypoint) {
    return guard(() async {
      final input = WaypointMapper.toGQLUpdateInput(waypoint);
      final gqlResult = await remote.updateWaypoint(
        id: waypoint.id,
        input: input,
      );
      return WaypointMapper.fromGQL(gqlResult);
    });
  }

  @override
  Future<Either<Failure, void>> deleteWaypoint(Id<Waypoint> id) {
    return guard(() async {
      await remote.deleteWaypoint(id: id);
    });
  }
}
