import 'package:dartz/dartz.dart';
import 'package:domain_core/failure.dart';
import 'package:trip_domain/domain/types/topology_res.dart';
import 'package:trip_domain/trip_domain.dart';
import 'package:vamos_cartographie/infrastructure/topology/datasources/topology_remote_datasource.dart';
import 'package:vamos_cartographie/infrastructure/topology/mappers/topology_mappers.dart';

class TopologyRepositoryImpl extends TopologyRepository {
  final TopologyRemoteDatasource remote;

  TopologyRepositoryImpl(this.remote);

  @override
  Future<Either<Failure, TopologyRes>> getTopology(TripId tripId) async {
    try {
      final data = await remote.getTopology(tripId: tripId);
      final ret = TopologyMappers.fromGQL(data);
      return Right(ret);
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (_) {
      return Left(const ConnectionFailure());
    }
  }
}
