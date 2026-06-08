import 'package:dartz/dartz.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/core/failure.dart';
import 'package:vamos_cartographie/features/topology/data/datasources/vertex_remote_datasource.dart';
import 'package:vamos_cartographie/features/topology/data/mappers/gis_mapper.dart';
import 'package:vamos_cartographie/features/topology/data/mappers/vertex_mappers.dart';
import 'package:vamos_cartographie/features/topology/domain/entities/vertex.dart';

class VertexRepository {
  final VertexRemoteDatasource remote;
  VertexRepository(this.remote);

  Future<Either<Failure, List<Vertex>>> getVertices(int tripId) async {
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
    int tripId,
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
    int vertexId,
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

  Future<Either<Failure, void>> deleteVertex(int vertexId) async {
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
