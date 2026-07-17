import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';
import '/topology/domain/entities/entities.dart';
import '/trip/domain/domain.dart';

abstract class SegmentRepository {
  Future<Either<Failure, SegmentRemoteModel>> updateSegment(
    SegmentFields segment,
  );
  Future<Either<Failure, void>> deleteSegment(SegmentId id);
  Future<Either<Failure, List<SegmentRemoteModel>>> getSegments(TripId tripId);
}
