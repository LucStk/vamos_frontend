import 'package:dartz/dartz.dart';
import "package:domain_core/domain_core.dart";
import 'package:trip_application/trip_application.dart';

import 'package:vamos_cartographie/core/core.dart';
import 'package:vamos_cartographie/domain_features/topology/data/data.dart';

class TopologyRepositoryImpl extends TopologyRepository {
  final TopologyRemoteDatasource remote;

  TopologyRepositoryImpl(this.remote);

  @override
  Future<Either<Failure, TopologyRes>> getTopology(TripId tripId) {
    return guard(() async {
      final data = await remote.getTopology(tripId: tripId);
      return data.toDomain();
    });
  }
}
