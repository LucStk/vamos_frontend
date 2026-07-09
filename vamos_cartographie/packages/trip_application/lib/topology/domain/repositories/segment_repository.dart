import 'package:dartz/dartz.dart';
import 'package:domain_core/failure.dart';
import '/topology/domain/entities/entities.dart';
import '/trip/domain/domain.dart';

abstract class SegmentRepository {
  Future<Either<Failure, Segment>> updateSegment(Segment segment);
  Future<Either<Failure, void>> deleteSegment(SegmentId id);
  Future<Either<Failure, List<Segment>>> getSegments(TripId tripId);
}
