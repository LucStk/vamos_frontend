import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';
import 'package:trip_domain/domain/entities/entities.dart';
import 'package:trip_domain/domain/types/Ids.dart';

abstract class TopologyRepository {
  Future<Either<Failure, List<Segment>>> getTopology(TripId id);
}
