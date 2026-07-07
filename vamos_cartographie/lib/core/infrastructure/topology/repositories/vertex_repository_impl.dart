import 'package:dartz/dartz.dart';
import 'package:latlong2/latlong.dart';
import 'package:domain_core/domain_core.dart';
import 'package:trip_domain/trip_domain.dart';
import 'package:vamos_cartographie/core/erreur_handler.dart';

import "package:vamos_cartographie/features/shared/shared.dart";
import '/core/infrastructure/topology/datasources/datasources.dart';
import '/core/infrastructure/topology/mappers/vertex_mappers.dart';

class VertexRepositoryImpl extends VertexRepository {
  final VertexRemoteDatasource remote;
  VertexRepositoryImpl(this.remote);
  @override
  Future<Either<Failure, List<Vertex>>> getVertices(Id<Trip> tripId) {
    return guard(() async {
      final segments = await remote.getVertices(tripId: tripId);
      return segments.map(VertexMapper.fromGQL).toList();
    });
  }

  @override
  Future<Either<Failure, Vertex>> createVertex(Id<Trip> tripId, LatLng latLng) {
    return guard(() async {
      final gqlResult = await remote.createVertex(
        tripId: tripId,
        latLng: GisMapper.toGQL(latLng),
      );
      return VertexMapper.fromGQL(gqlResult);
    });
  }

  @override
  Future<Either<Failure, Vertex>> moveVertex(
    Id<Vertex> vertexId,
    LatLng latLng,
  ) {
    return guard(() async {
      final gqlResult = await remote.moveVertex(
        id: vertexId,
        latLng: GisMapper.toGQL(latLng),
      );
      return VertexMapper.fromGQL(gqlResult);
    });
  }

  @override
  Future<Either<Failure, void>> deleteVertex(Id<Vertex> vertexId) {
    return guard(() async {
      await remote.deleteVertex(id: vertexId);
    });
  }
}
