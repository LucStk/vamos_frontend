import 'package:dartz/dartz.dart';
import 'package:vamos_cartographie/core/failure.dart';
import 'package:vamos_cartographie/data/datasources/trip_remote_datasource.dart';
import 'package:vamos_cartographie/data/mappers/trip_mappers.dart';
import 'package:vamos_cartographie/domain/models.dart';
import 'i_trip_repository.dart';

/// Implémentation concrète de [ITripRepository].
///
/// Ce repository fait le lien entre la couche domaine (modèles [Trip]) et la
/// couche données ([TripRemoteDatasource]). Il délègue les appels réseau au
/// datasource et utilise [TripMapper] pour convertir les types GQL en modèles
/// domaine (et inversement).
class TripRepository implements ITripRepository {
  final TripRemoteDatasource remote;

  TripRepository(this.remote);

  // ---------------------------------------------------------------------------
  // Queries
  // ---------------------------------------------------------------------------

  @override
  Future<Either<Failure, List<Trip>>> getAllTrips() async {
    try {
      final gqlTrips = await remote.getAllTrips();
      final trips = gqlTrips.map(TripMapper.tripFromGQLFields).toList();
      return Right(trips);
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (_) {
      return Left(const ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, Trip>> getTrip(int id) async {
    try {
      final gqlTrip = await remote.getTripById(id: id);
      return Right(TripMapper.tripFromGQLDetail(gqlTrip));
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
  Future<Either<Failure, Trip>> createTrip(Trip trip) async {
    try {
      final input = TripMapper.tripToGQLInput(trip);
      final gqlResult = await remote.createTrip(input: input);
      return Right(TripMapper.tripFromGQLCreateResult(gqlResult));
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (_) {
      return Left(const ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, Trip>> updateTrip(int id, Trip trip) async {
    try {
      final input = TripMapper.tripToGQLUpdateInput(trip);
      final gqlResult = await remote.updateTrip(id: id, input: input);
      return Right(TripMapper.tripFromGQLUpdateResult(gqlResult));
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (_) {
      return Left(const ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteTrip(int id) async {
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
