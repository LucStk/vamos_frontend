import 'package:api_client/api_client.dart';
import 'package:dartz/dartz.dart';
import 'package:ferry/ferry.dart';
import 'package:vamos_cartographie/core/failure.dart';
import 'package:vamos_cartographie/models.dart';
import 'package:vamos_cartographie/repository/trip_repository.dart';

class RealTripRepository implements TripRepository {
  final Client _client;

  RealTripRepository(this._client);

  @override
  Future<Either<Failure, List<GTripFieldsData>>> getAllTrips() async {
    try {
      final response = await _client
          .request(GGetAllTripsReq(fetchPolicy: FetchPolicy.NetworkOnly))
          .first;

      if (response.hasErrors) {
        return Left(
          ServerFailure(
            response.graphqlErrors?.first.message ?? "Erreur inconnue",
          ),
        );
      }

      final trips = response.data?.trips;
      if (trips == null) return Left(NotFoundFailure());

      return Right(trips.toList());
    } catch (e) {
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, Trip>> getTrip(String id) async {
    try {
      final response = await _client
          .request(GGetTripReq(vars: GGetTripVars(id: id)))
          .first;

      if (response.hasErrors) {
        return Left(ServerFailure(response.graphqlErrors!.first.message));
      }

      if (response.data?.trip == null) return Left(NotFoundFailure());

      return Right(Trip.fromGQL(response.data!.trip!));
    } catch (e) {
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, String>> createTrip(Trip trip) async {
    try {
      final response = await _client
          .request(
            GCreateTripReq(vars: GCreateTripVars(trip: trip.toGQLInput())),
          )
          .first;

      if (response.hasErrors) {
        return Left(ServerFailure(response.graphqlErrors!.first.message));
      }

      if (response.data?.createTrip == null) return Left(NotFoundFailure());

      return Right(response.data!.createTrip!.trip.id);
    } catch (e) {
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, String>> updateTrip(Trip trip) async {
    try {
      final response = await _client
          .request(
            GUpdateTripReq(
              vars: GUpdateTripVars(id: trip.id!, trip: trip.toGQLInput()),
            ),
          )
          .first;

      if (response.hasErrors) {
        return Left(ServerFailure(response.graphqlErrors!.first.message));
      }

      if (response.data?.updateTrip == null) return Left(NotFoundFailure());

      return Right(response.data!.updateTrip!.trip.id);
    } catch (e) {
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> deleteTrip(String id) async {
    try {
      final response = await _client
          .request(GDeleteTripReq(vars: GDeleteTripVars(id: id)))
          .first;

      if (response.hasErrors) {
        return Left(ServerFailure(response.graphqlErrors!.first.message));
      }

      if (response.data?.deleteTrip == null) return Left(NotFoundFailure());

      return Right(true);
    } catch (e) {
      return Left(ConnectionFailure());
    }
  }
}
