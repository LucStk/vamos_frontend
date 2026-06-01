import 'package:dartz/dartz.dart';
import 'package:vamos_cartographie/core/failure.dart';
import 'package:vamos_cartographie/features/segments/domain/entities/entities.dart';

// import 'dart:io';

abstract class ISegmentRepository {
  Future<Either<Failure, List<Segment>>> getSegments(int tripId);
  Future<Either<Failure, Segment>> createSegment(
    int tripId,
    SegmentDraft segment,
  );
  Future<Either<Failure, Segment>> updateSegment(int id, SegmentDraft segment);
  Future<Either<Failure, void>> deleteSegment(int id);
}
