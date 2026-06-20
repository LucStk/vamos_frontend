import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';
import 'package:topology_engine/domain/types/geometry.dart';
import 'package:topology_engine/topology_engine.dart';

abstract class SegmentGeometryPort {
  Future<Either<Failure, Segment>> updateGeometry(
    SegmentId segmentId,
    Geometry geometry,
  );
}
