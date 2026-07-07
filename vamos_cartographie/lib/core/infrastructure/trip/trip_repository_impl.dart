import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';
import 'package:media_application/domain/entities/media_image.dart';
import 'package:trip_domain/domain/types/topology_res.dart';
import 'package:vamos_cartographie/core/erreur_handler.dart';
import '/core/infrastructure/trip/data.dart';
import 'package:trip_domain/trip_domain.dart';
import '/core/infrastructure/trip/trip_mappers.dart';

class TripRepositoryImpl extends TripRepository {
  final TripRemoteDatasource remote;

  TripRepositoryImpl(this.remote);

  // ---------------------------------------------------------------------------
  // Queries
  // ---------------------------------------------------------------------------
  @override
  Future<Either<Failure, List<(Trip, List<MediaImage>)>>> getAllTrips() {
    return guard(() async {
      final gqlTrips = await remote.getAllTrips();
      return gqlTrips.map(TripMapper.fromGQLDetail).toList();
    });
  }

  @override
  Future<Either<Failure, (Trip, List<MediaImage>)>> getTrip(Id<Trip> id) {
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

  // @override
  // Future<Either<Failure, Trip>> createTrip(TripDraft trip) async {
  //   try {
  //     final input = TripDraftMapper.toGQLInput(trip);
  //     final gqlResult = await remote.createTrip(input: input);
  //     final createdTrip = TripMapper.fromGQLCreateResult(gqlResult);
  //     return Right(createdTrip);
  //   } on Exception catch (e) {
  //     return Left(ServerFailure(e.toString()));
  //   } catch (_) {
  //     return Left(const ConnectionFailure());
  //   }
  // }
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
