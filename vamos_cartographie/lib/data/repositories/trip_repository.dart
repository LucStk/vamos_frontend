import 'package:api_client/api_client.dart';
import 'package:dartz/dartz.dart';
import 'package:ferry/ferry.dart';
import 'package:vamos_cartographie/core/failure.dart';
import 'package:vamos_cartographie/domain/models.dart';
import 'package:vamos_cartographie/data/datasources/trip_remote_datasource.dart';
import 'i_trip_repository.dart';

class TripRepository implements ITripRepository {
  final TripRemoteDatasource remote;

  TripRepository(this.remote);

  @override
  Future<Either<Failure, List<Trip>>> getAllTrips() async {
    try {
      final response = await remote.getAllTrips();
      final trips = response.data?.trips;
      if (trips == null) return Left(NotFoundFailure());

      return Right(trips.toList());
    } catch (e) {
      return Left(ConnectionFailure());
    }
  }

  Future<Either<Failure, Trip>> getTrip(String id) async {
    try {
      final response = await _client
          .request(GGetTripReq(vars: GGetTripVars(id: id)))
          .first;

      if (response.hasErrors) {
        return Left(ServerFailure(response.graphqlErrors!.first.message));
      }

      final node = response.data?.node;
      if (node == null) return Left(NotFoundFailure());

      // 1. On vérifie si le node est bien du sous-type TripType généré par ton outil GQL
      if (node is GGetTripData_node__asTripType) {
        // 2. Le smart-cast de Dart fait qu'ici, 'node' est automatiquement typé en GGetTripData_node__asTripType
        return Right(Trip.fromGQL(node));
      }

      // Si le node existe mais n'est pas un TripType (ex: c'est un WaypointType)
      return Left(NotFoundFailure());
    } catch (e) {
      return Left(ConnectionFailure());
    }
  }

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

      return Right(response.data!.createTrip.id);
    } catch (e) {
      return Left(ConnectionFailure());
    }
  }

  Future<Either<Failure, String>> updateTrip(Trip trip) async {
    try {
      final response = await _client
          .request(
            GUpdateTripReq(
              vars: GUpdateTripVars(trip: trip.toGQLUpdateInput()),
            ),
          )
          .first;

      if (response.hasErrors) {
        return Left(ServerFailure(response.graphqlErrors!.first.message));
      }

      if (response.data?.updateTrip == null) return Left(NotFoundFailure());

      return Right(response.data!.updateTrip.id);
    } catch (e) {
      return Left(ConnectionFailure());
    }
  }

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
