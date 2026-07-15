import 'package:dartz/dartz.dart';
import "package:domain_core/domain_core.dart";
import 'package:trip_application/trip_application.dart';

import 'package:vamos_cartographie/core/services/erreur_handler.dart';
import 'package:vamos_cartographie/topology/data/datasources/topology_remote_datasource.dart';
import 'package:vamos_cartographie/topology/data/mappers/mappers.dart';

class TopologyRepositoryImpl extends TopologyRepository {
  final TopologyRemoteDatasource remote;

  TopologyRepositoryImpl(this.remote);

  @override
  Future<Either<Failure, TopologyRes>> getTopology(TripId tripId) {
    return guard(() async {
      final data = await remote.getTopology(tripId: tripId);
      return TopologyMappers.fromGQL(data);
    });
  }
}
