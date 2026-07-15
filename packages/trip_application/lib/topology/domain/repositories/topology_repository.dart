import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';
import '/topology/domain/types/types.dart';
import '/trip/domain/trip.dart';

abstract class TopologyRepository {
  Future<Either<Failure, TopologyRes>> getTopology(TripId id);
}
