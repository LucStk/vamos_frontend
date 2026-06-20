import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';
import 'package:topology_application/helpers/gis.dart';
import 'package:topology_engine/domain/entities/segment.dart';

abstract class SegmentGeometryPort {
  Future<Either<Failure, Segment>> updateGeometry(
    SegmentId segmentId,
    Geometry geometry,
  );
}
