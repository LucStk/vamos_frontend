import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';
import 'package:vamos_cartographie/infrastructure/trip/data.dart';
import 'package:vamos_cartographie/infrastructure/trip/mappers/trip_draft_mappers.dart';
import 'package:trip_domain/trip_domain.dart';

class TripRepositoryImpl extends TripRepository {
  final TripRemoteDatasource remote;

  TripRepositoryImpl(this.remote);

  // ---------------------------------------------------------------------------
  // Queries
  // ---------------------------------------------------------------------------
  @override
  Future<Either<Failure, List<Trip>>> getAllTrips() async {
    try {
      final gqlTrips = await remote.getAllTrips();
      return Right(gqlTrips.map(TripMapper.fromGQLFields).toList());
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (_) {
      return Left(const ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, Trip>> getTrip(Id<Trip> id) async {
    try {
      final gqlTrip = await remote.getTripById(id: id);
      return Right(TripMapper.fromGQLDetail(gqlTrip));
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (_) {
      return Left(const ConnectionFailure());
    }
  }

  // ---------------------------------------------------------------------------
  // Mutations
  // ---------------------------------------------------------------------------

  @override
  Future<Either<Failure, Trip>> createTrip(TripDraft trip) async {
    try {
      final input = TripDraftMapper.toGQLInput(trip);
      final gqlResult = await remote.createTrip(input: input);
      final createdTrip = TripMapper.fromGQLCreateResult(gqlResult);
      return Right(createdTrip);
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (_) {
      return Left(const ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, Trip>> updateTrip(Id<Trip> id, TripDraft trip) async {
    try {
      final input = TripDraftMapper.toGQLUpdateInput(trip);
      final gqlResult = await remote.updateTrip(id: id, input: input);
      final updatedTrip = TripMapper.fromGQLUpdateResult(gqlResult);

      return Right(updatedTrip);
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (_) {
      return Left(const ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteTrip(Id<Trip> id) async {
    try {
      await remote.deleteTrip(id: id);
      return const Right(null);
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (_) {
      return Left(const ConnectionFailure());
    }
  }
}
