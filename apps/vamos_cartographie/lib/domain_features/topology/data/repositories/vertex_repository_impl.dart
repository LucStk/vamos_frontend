import 'package:dartz/dartz.dart';
import 'package:latlong2/latlong.dart';
import 'package:domain_core/domain_core.dart';
import 'package:trip_application/trip_application.dart';

import '../datasources/datasources.dart';
import '../mappers/geometry_mapper.dart';
import '../mappers/vertex_mappers.dart';
import '/core/erreur_handler.dart';

class VertexRepositoryImpl extends VertexRepository {
  final VertexRemoteDatasource remote;
  VertexRepositoryImpl(this.remote);
  @override
  Future<Either<Failure, List<VertexRemoteModel>>> getVertices(
    Id<Trip> tripId,
  ) {
    return guard(() async {
      final segments = await remote.getVertices(tripId: tripId);
      return segments.map((m) => m.toDomain()).toList();
    });
  }

  @override
  Future<Either<Failure, VertexRemoteModel>> createVertex(
    Id<Trip> tripId,
    LatLng latLng,
  ) {
    return guard(() async {
      final gqlResult = await remote.createVertex(
        tripId: tripId,
        latLng: latLng.toGQLInput(),
      );
      return gqlResult.toDomain();
    });
  }

  @override
  Future<Either<Failure, VertexRemoteModel>> moveVertex(
    VertexId vertexId,
    LatLng latLng,
  ) {
    return guard(() async {
      final gqlResult = await remote.moveVertex(
        id: vertexId,
        latLng: latLng.toGQLInput(),
      );
      return gqlResult.toDomain();
    });
  }

  @override
  Future<Either<Failure, void>> deleteVertex(VertexId vertexId) {
    return guard(() async {
      await remote.deleteVertex(id: vertexId);
    });
  }
}
