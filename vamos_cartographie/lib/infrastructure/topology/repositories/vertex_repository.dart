import 'package:dartz/dartz.dart';
import 'package:latlong2/latlong.dart';
import 'package:domain_core/domain_core.dart';
import 'package:topology_engine/topology_engine.dart';
import 'package:trip_domain/domain/domain.dart';

import "package:vamos_cartographie/features/shared/shared.dart";
import 'package:vamos_cartographie/infrastructure/topology/datasources/vertex_remote_datasource.dart';
import 'package:vamos_cartographie/infrastructure/topology/mappers/vertex_mappers.dart';

class VertexRepository {
  final VertexRemoteDatasource remote;
  VertexRepository(this.remote);

  Future<Either<Failure, List<Vertex>>> getVertices(Id<Trip> tripId) async {
    try {
      final segments = await remote.getVertices(tripId: tripId);
      final ret = segments.map(VertexMapper.fromGQL).toList();
      return Right(ret);
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (_) {
      return Left(const ConnectionFailure());
    }
  }

  Future<Either<Failure, Vertex>> createVertex(
    Id<Trip> tripId,
    LatLng latLng,
  ) async {
    try {
      final gqlResult = await remote.createVertex(
        tripId: tripId,
        latLng: GisMapper.toGQL(latLng),
      );
      final createSegment = VertexMapper.fromGQL(gqlResult);
      return Right(createSegment);
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (_) {
      return Left(const ConnectionFailure());
    }
  }

  Future<Either<Failure, Vertex>> moveVertex(
    Id<Vertex> vertexId,
    LatLng latLng,
  ) async {
    try {
      final gqlResult = await remote.moveVertex(
        id: vertexId,
        latLng: GisMapper.toGQL(latLng),
      );
      final movedVertex = VertexMapper.fromGQL(gqlResult);

      return Right(movedVertex);
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (_) {
      return Left(const ConnectionFailure());
    }
  }

  Future<Either<Failure, void>> deleteVertex(Id<Vertex> vertexId) async {
    try {
      await remote.deleteVertex(id: vertexId);
      return const Right(null);
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (_) {
      return Left(const ConnectionFailure());
    }
  }
}
