import 'package:dartz/dartz.dart';
import 'package:latlong2/latlong.dart';
import 'package:trip_application/trip_application.dart';

import 'package:vamos_cartographie/core/services/erreur_handler.dart';
import 'package:domain_core/domain_core.dart';
import 'package:vamos_cartographie/topology/data/datasources/segment_remote_datasource.dart';
import 'package:vamos_cartographie/topology/data/mappers/mappers.dart';

class SegmentRepositoryImpl extends SegmentRepository {
  final SegmentRemoteDatasource remote;

  SegmentRepositoryImpl(this.remote);

  @override
  Future<Either<Failure, List<SegmentRemoteModel>>> getSegments(
    Id<Trip> tripId,
  ) {
    return guard(() async {
      final segments = await remote.getSegments(tripId: tripId);
      return segments.map((m) => m.toSegmentRemoteModel()).toList();
    });
  }

  @override
  Future<Either<Failure, SegmentRemoteModel>> createSegment({
    required Id<Trip> tripId,
    required VertexId startVertexId,
    required VertexId endVertexId,
    required MobilityType mobilityType,
    required List<LatLng> geometry,
  }) async {
    return guard(() async {
      final gqlResult = await remote.createSegment(
        tripId: tripId,
        startVertexId: startVertexId,
        endVertexId: endVertexId,
        mobilityType: mobilityType,
        geometry: geometry,
      );
      return gqlResult.toSegmentRemoteModel();
    });
  }

  @override
  Future<Either<Failure, SegmentRemoteModel>> updateSegment(
    SegmentFields segment,
  ) async {
    return guard(() async {
      final gqlResult = await remote.updateSegment(
        id: segment.id,
        input: segment.toGQLUpdateInput(),
      );
      return gqlResult.toSegmentRemoteModel();
    });
  }

  @override
  Future<Either<Failure, void>> deleteSegment(SegmentId id) async {
    return guard(() async {
      await remote.deleteSegment(id: id);
    });
  }
}
