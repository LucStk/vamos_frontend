import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';
import 'package:topology_engine/domain/entities/segment.dart';
import 'package:topology_engine/domain/value_objects/graph_id.dart';

abstract class SegmentPort {
  Future<Either<Failure, Segment>> createSegment(
    GraphId graphId,
    SegmentDraft draft,
  );

  Future<Either<Failure, Unit>> deleteSegment(Id<Segment> id);

  Future<Either<Failure, Segment>> updateSegment(
    Id<Segment> id,
    SegmentDraft draft,
  );
}
