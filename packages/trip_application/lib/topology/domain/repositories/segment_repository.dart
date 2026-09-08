import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';
import 'package:latlong2/latlong.dart';
import 'package:trip_application/topology/domain/domain.dart';
import '/trip/domain/domain.dart';

abstract class SegmentRepository {
  Future<Either<Failure, SegmentRemoteModel>> updateSegment(
    SegmentFields segment,
  );
  Future<Either<Failure, SegmentRemoteModel>> correctSegment(
    SegmentId segmentId,
    List<LatLng> correction,
  );

  Future<Either<Failure, CreateSegmentPayload>> createSegment({
    required Id<Trip> tripId,
    required VertexId startVertexId,
    VertexId? endVertexId,
    required MobilityType mobilityType,
    required List<LatLng> geometry,
  });
  Future<Either<Failure, RefineSegmentPayload>> refineSegment(
    SegmentId segmentId,
  );
  Future<Either<Failure, (List<SegmentId>, SegmentRemoteModel)>> spliceSegment({
    required TripId tripId,
    required List<LatLng> correction,
    required MobilityType mobilityType,
    required SpliceAnchor startAnchor,
    required SpliceAnchor endAnchor,
  });
  Future<Either<Failure, void>> deleteSegment(SegmentId id);
  Future<Either<Failure, List<SegmentRemoteModel>>> getSegments(TripId tripId);
}
