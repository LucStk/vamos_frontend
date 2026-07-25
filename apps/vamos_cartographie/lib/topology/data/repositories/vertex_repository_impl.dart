import 'package:dartz/dartz.dart';
import 'package:latlong2/latlong.dart';
import 'package:domain_core/domain_core.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/core/mappers/mappers.dart';

import 'package:vamos_cartographie/core/services/erreur_handler.dart';
import 'package:vamos_cartographie/topology/data/datasources/vertex_remote_datasource.dart';
import 'package:vamos_cartographie/topology/data/mappers/mappers.dart';

class VertexRepositoryImpl extends VertexRepository {
  final VertexRemoteDatasource remote;
  VertexRepositoryImpl(this.remote);
  @override
  Future<Either<Failure, List<VertexRemoteModel>>> getVertices(
    Id<Trip> tripId,
  ) {
    return guard(() async {
      final segments = await remote.getVertices(tripId: tripId);
      return segments.map((m) => m.toVertexRemoteModel()).toList();
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
      return gqlResult.toVertexRemoteModel();
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
      return gqlResult.toVertexRemoteModel();
    });
  }

  @override
  Future<Either<Failure, void>> deleteVertex(VertexId vertexId) {
    return guard(() async {
      await remote.deleteVertex(id: vertexId);
    });
  }
}
