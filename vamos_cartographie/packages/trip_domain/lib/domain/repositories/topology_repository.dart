import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';
import 'package:trip_domain/domain/types/Ids.dart';
import 'package:trip_domain/domain/types/topology_res.dart';

abstract class TopologyRepository {
  Future<Either<Failure, TopologyRes>> getTopology(TripId id);
}
