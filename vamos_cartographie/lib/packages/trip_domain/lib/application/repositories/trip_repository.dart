import 'package:dartz/dartz.dart';
import 'package:domain_core/failure.dart';
import 'package:trip_domain/domain/domain.dart';

abstract class TripRepository {
  Future<Either<Failure, List<(Trip, List<MediaImage>)>>> getAllTrips();
  Future<Either<Failure, (Trip, List<MediaImage>)>> getTrip(TripId id);
  Future<Either<Failure, Trip>> updateTrip(Trip trip);
  Future<Either<Failure, void>> deleteTrip(TripId id);
  Future<Either<Failure, Trip>> createBlankTrip();
}
