import 'package:dartz/dartz.dart';
import "package:domain_core/domain_core.dart";
import 'package:trip_application/trip_application.dart';

import '../datasources/datasources.dart';
import '../mappers/topology_mappers.dart';
import '/core/erreur_handler.dart';

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
