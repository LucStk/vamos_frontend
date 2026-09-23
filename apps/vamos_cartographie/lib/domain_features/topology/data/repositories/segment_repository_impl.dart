import 'package:dartz/dartz.dart';
import 'package:latlong2/latlong.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/core/core.dart';
import 'package:domain_core/domain_core.dart';
import '/domain_features/topology/data/data.dart';

class SegmentRepositoryImpl extends SegmentRepository {
  final SegmentRemoteDatasource remote;

  SegmentRepositoryImpl(this.remote);

  @override
  Future<Either<Failure, List<SegmentRemoteModel>>> getSegments(
    Id<Trip> tripId,
  ) {
    return guard(() async {
      final segments = await remote.getSegments(tripId: tripId);
      return segments.map((m) => m.toDomain()).toList();
    });
  }

  @override
  Future<Either<Failure, CreateSegmentPayload>> createSegment({
    required Id<Trip> tripId,
    required VertexId startVertexId,
    required MobilityType mobilityType,
    required List<LatLng> geometry,
    VertexId? endVertexId,
  }) async {
    return guard(() async {
      final gqlResult = await remote.createSegment(
        tripId: tripId,
        startVertexId: startVertexId,
        endVertexId: endVertexId,
        mobilityType: mobilityType,
        geometry: geometry,
      );
      return CreateSegmentPayload(
        vertex: gqlResult.vertex.toDomain(),
        segment: gqlResult.segment.toDomain(),
        rafinementFailed: gqlResult.refinementFailed,
        errorMessage: gqlResult.errorMessage,
      );
    });
  }

  @override
  Future<Either<Failure, RefineSegmentPayload>> refineSegment(
    SegmentId segmentId,
  ) async {
    return guard(() async {
      final gqlResult = await remote.refineSegment(segmentId);
      return RefineSegmentPayload(
        segment: gqlResult.segment.toDomain(),
        rafinementFailed: gqlResult.refinementFailed,
        errorMessage: gqlResult.errorMessage,
      );
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
      return gqlResult.toDomain();
    });
  }

  @override
  Future<Either<Failure, SegmentRemoteModel>> correctSegment(
    SegmentId segmentId,
    List<LatLng> correction,
  ) async {
    return guard(() async {
      final gqlResult = await remote.correctSegment(
        id: segmentId,
        input: GSegmentCorrectionInput(
          correction: correction.map((m) => m.toGQLInput()).toList(),
        ),
      );
      return gqlResult.toDomain();
    });
  }

  @override
  Future<Either<Failure, (List<SegmentId>, SegmentRemoteModel)>> spliceSegment({
    required TripId tripId,
    required List<LatLng> correction,
    required MobilityType mobilityType,
    required SpliceAnchor startAnchor,
    required SpliceAnchor endAnchor,
  }) async {
    return guard(() async {
      final gqlResult = await remote.spliceSegment(
        tripId: tripId,
        input: GSpliceSegmentInput(
          startAnchor: startAnchor.toGQLSegmentAnchorInput(),
          endAnchor: endAnchor.toGQLSegmentAnchorInput(),
          correction: correction.map((m) => m.toGQLInput()).toList(),
          mobilityType: mobilityType.toGQL(),
        ),
      );
      return (
        gqlResult.deletedSegmentIds.map((i) => SegmentId(i)).toList(),
        gqlResult.segment.toDomain(),
      );
    });
  }

  @override
  Future<Either<Failure, void>> deleteSegment(SegmentId id) async {
    return guard(() async {
      await remote.deleteSegment(id: id);
    });
  }
}
