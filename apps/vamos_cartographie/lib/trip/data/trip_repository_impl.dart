import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';
import 'package:stored_file_application/stored_file_application.dart';
import 'package:trip_application/trip_application.dart';
import 'trip_remote_datasource.dart';
import 'trip_mappers.dart';

import 'package:vamos_cartographie/core/services/erreur_handler.dart';

class TripRepositoryImpl extends TripRepository {
  final TripRemoteDatasource remote;

  TripRepositoryImpl(this.remote);

  // ---------------------------------------------------------------------------
  // Queries
  // ---------------------------------------------------------------------------
  @override
  Future<Either<Failure, List<(Trip, List<StoredFileRemoteModel>)>>>
  getAllTrips() {
    return guard(() async {
      final gqlTrips = await remote.getAllTrips();
      return gqlTrips.map(TripMapper.fromGQLDetail).toList();
    });
  }

  @override
  Future<Either<Failure, (Trip, List<StoredFileRemoteModel>)>> getTrip(
    Id<Trip> id,
  ) {
    return guard(() async {
      final gqlTrip = await remote.getTripById(id: id);
      return TripMapper.fromGQLDetail(gqlTrip);
    });
  }

  @override
  Future<Either<Failure, TripDetailsRes>> getTripDetails(Id<Trip> id) {
    return guard(() async {
      final gqlTrip = await remote.getTripDetails(id: id);
      return TripMapper.fromGQLDetails(gqlTrip);
    });
  }
  // ---------------------------------------------------------------------------
  // Mutations
  // ---------------------------------------------------------------------------

  @override
  Future<Either<Failure, Trip>> createBlankTrip() async {
    return guard(() async {
      final gqlResult = await remote.createBlankTrip();
      return TripMapper.fromGQLCreateResult(gqlResult);
    });
  }

  @override
  Future<Either<Failure, Trip>> updateTrip(Trip trip) async {
    return guard(() async {
      final input = TripMapper.toGQLUpdateInput(trip);
      final gqlResult = await remote.updateTrip(id: trip.id, input: input);
      return TripMapper.fromGQLUpdateResult(gqlResult);
    });
  }

  @override
  Future<Either<Failure, void>> deleteTrip(Id<Trip> id) async {
    return guard(() async {
      await remote.deleteTrip(id: id);
    });
  }
}
