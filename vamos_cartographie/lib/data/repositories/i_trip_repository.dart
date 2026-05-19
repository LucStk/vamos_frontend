// i_trip_repository.dart
import 'package:dartz/dartz.dart';
import 'package:vamos_cartographie/core/failure.dart';
import 'package:vamos_cartographie/domain/models.dart';

abstract class ITripRepository {
  Future<Either<Failure, List<Trip>>> getAllTrips();

  Future<Trip> getTrip(int id);

  Future<Trip> createTrip({required String title, String? description});
}
