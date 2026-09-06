import 'package:dartz/dartz.dart';
import 'package:gql_tristate_value/gql_tristate_value.dart';
import 'package:latlong2/latlong.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/core/graphql/graphql.dart';
import 'package:vamos_cartographie/core/mappers/geometry_mapper.dart';

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
  Future<Either<Failure, (SegmentRemoteModel, VertexRemoteModel)>>
  createSegment({
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
      return (
        gqlResult.toSegmentRemoteModel(),
        gqlResult.toEndVertexRemoteModel(),
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
      return gqlResult.toSegmentRemoteModel();
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
      return gqlResult.toSegmentRemoteModel();
    });
  }

  @override
  Future<Either<Failure, (List<SegmentId>, SegmentRemoteModel)>> mergeSegments({
    required TripId tripId,
    required List<LatLng> correction,
    required MobilityType mobilityType,
    SegmentId? startSegmentId,
    SegmentId? endSegmentId,
    VertexId? startVertexId,
    VertexId? endVertexId,
  }) async {
    return guard(() async {
      final gqlResult = await remote.mergeSegments(
        tripId: tripId,
        input: GSegmentMergeInput(
          startPoint: GSegmentReferenceInput(
            segmentId: (startSegmentId != null)
                ? Value.present(startSegmentId.toString())
                : Value.absent(),
            vertexId: (startVertexId != null)
                ? Value.present(startVertexId.toString())
                : Value.absent(),
          ),
          endPoint: GSegmentReferenceInput(
            segmentId: (endSegmentId != null)
                ? Value.present(endSegmentId.toString())
                : Value.absent(),
            vertexId: (endVertexId != null)
                ? Value.present(endVertexId.toString())
                : Value.absent(),
          ),
          correction: correction.map((m) => m.toGQLInput()).toList(),
          mobilityType: mobilityType.toGQL(),
        ),
      );
      return (
        gqlResult.deletedSegmentIds.map((i) => SegmentId(i)).toList(),
        gqlResult.segment.toSegmentRemoteModel(),
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
