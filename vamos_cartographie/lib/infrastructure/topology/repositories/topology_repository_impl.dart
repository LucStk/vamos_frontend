import 'package:dartz/dartz.dart';
import 'package:domain_core/failure.dart';
import 'package:trip_domain/trip_domain.dart';
import 'package:vamos_cartographie/infrastructure/topology/datasources/topology_remote_datasource.dart';

class TopologyRepositoryImpl extends TopologyRepository {
  final TopologyRemoteDatasource remote;

  TopologyRepositoryImpl(this.remote);

  @override
  Future<Either<Failure, List<Segment>>> getTopology(TripId tripId) async {
    try {
      final segments = await remote.getSegments(tripId: tripId);
      final ret = segments.map(SegmentMapper.fromGQL).toList();
      return Right(ret);
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (_) {
      return Left(const ConnectionFailure());
    }
  }
}
