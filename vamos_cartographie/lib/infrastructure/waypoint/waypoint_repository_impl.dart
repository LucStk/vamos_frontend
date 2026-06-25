import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';
import 'package:trip_domain/trip_domain.dart';
import 'package:vamos_cartographie/infrastructure/topology/mappers/vertex_mappers.dart';
import 'package:vamos_cartographie/infrastructure/waypoint/mappers/mappers.dart';
import 'package:vamos_cartographie/infrastructure/waypoint/waypoint_remote_datasource.dart';
import "package:latlong2/latlong.dart";

class WaypointRepositoryImpl extends WaypointRepository {
  final WaypointRemoteDatasource remote;

  WaypointRepositoryImpl(this.remote);

  @override
  Future<Either<Failure, List<Waypoint>>> getWaypoints(Id<Trip> tripId) async {
    try {
      final waypoints = await remote.getWaypoints(tripId: tripId);
      final ret = waypoints.map((w) => WaypointMapper.fromGQL(w)).toList();
      return Right(ret);
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (_) {
      return Left(const ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, (Waypoint, Vertex)>> createBlankWaypoint(
    Id<Trip> tripId,
    Id<Vertex>? vertexId,
    LatLng? latLng,
  ) async {
    try {
      // Then create the waypoint with the vertex ID
      final gqlResult = await remote.createBlankWaypoint(
        tripId: tripId,
        vertexId: vertexId,
        latLng: latLng,
      );
      final createWaypoint = WaypointMapper.fromGQL(gqlResult.waypoint);
      final waypointVertex = VertexMapper.fromGQL(gqlResult.vertex);

      return Right((createWaypoint, waypointVertex));
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (_) {
      return Left(const ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, Waypoint>> updateWaypoint(Waypoint waypoint) async {
    try {
      final input = WaypointMapper.toGQLUpdateInput(waypoint);
      final gqlResult = await remote.updateWaypoint(
        id: waypoint.id,
        input: input,
      );
      final updatedWaypoint = WaypointMapper.fromGQL(gqlResult);

      return Right(updatedWaypoint);
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (_) {
      return Left(const ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteWaypoint(Id<Waypoint> id) async {
    try {
      await remote.deleteWaypoint(id: id);
      return const Right(null);
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (_) {
      return Left(const ConnectionFailure());
    }
  }
}
