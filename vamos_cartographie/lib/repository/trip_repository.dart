import 'package:api_client/api_client.dart';
import 'package:dartz/dartz.dart';
import 'package:vamos_cartographie/core/failure.dart';
import 'package:vamos_cartographie/models.dart';

/// Contrat commun entre le vrai repository (Ferry) et le mock.
abstract class TripRepository {
  Future<Either<Failure, List<GTripFieldsData>>> getAllTrips();
  Future<Either<Failure, Trip>> getTrip(String id);
  Future<Either<Failure, String>> createTrip(Trip trip);
  Future<Either<Failure, String>> updateTrip(Trip trip);
  Future<Either<Failure, bool>> deleteTrip(String id);
}
