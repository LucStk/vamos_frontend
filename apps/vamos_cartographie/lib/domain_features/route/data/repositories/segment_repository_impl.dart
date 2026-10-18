import 'package:dartz/dartz.dart';
import 'package:latlong2/latlong.dart';
import 'package:trip_application/trip_application.dart';
import 'package:domain_core/domain_core.dart';
import 'package:vamos_cartographie/core/erreur_handler.dart';
import 'package:vamos_cartographie/core/geometry_mappers/position_mapper.dart';
import 'package:vamos_cartographie/core/graphql/__generated__/schema.schema.gql.dart';
import 'package:vamos_cartographie/domain_features/topology/data/datasources/segment_remote_datasource.dart';
import 'package:vamos_cartographie/domain_features/topology/data/mappers/mobility_type_mapper.dart';
import 'package:vamos_cartographie/domain_features/topology/data/mappers/segment_mappers.dart';

class SegmentRepositoryImpl extends SegmentRepository {
  final SegmentRemoteDatasource remote;

  SegmentRepositoryImpl(this.remote);

  @override
  Future<Either<Failure, List<RouteSectionRemoteModel>>> getSegments(
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
    required MobilityType mobilityType,
    required List<LatLng> geometry,
    VertexId? endVertexId,
  }) async {
    return guard(() async {
      final gqlResult = await remote.createSegment(
        tripId: tripId,
        mobilityType: mobilityType,
        geometry: geometry,
      );
      return CreateSegmentPayload(
        segment: gqlResult.segment.toDomain(),
        rafinementFailed: gqlResult.refinementFailed,
        errorMessage: gqlResult.errorMessage,
      );
    });
  }

  @override
  Future<Either<Failure, RefineSegmentPayload>> refineSegment(
    SectionId segmentId,
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
  Future<Either<Failure, RouteSectionRemoteModel>> updateSegment(
    RouteSectionFields segment,
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
  Future<Either<Failure, RouteSectionRemoteModel>> correctSegment(
    SectionId segmentId,
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
  Future<Either<Failure, (List<SectionId>, RouteSectionRemoteModel)>>
  spliceSegment({
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
        gqlResult.deletedSegmentIds.map((i) => SectionId(i)).toList(),
        gqlResult.segment.toDomain(),
      );
    });
  }

  @override
  Future<Either<Failure, void>> deleteSegment(SectionId id) async {
    return guard(() async {
      await remote.deleteSegment(id: id);
    });
  }
}
