import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';
import 'package:trip_application/topology/domain/types/types.dart';
import 'package:trip_application/trip/domain/domain.dart';
import 'package:stored_file_application/stored_file_application.dart';

abstract class TripRepository {
  Future<Either<Failure, List<(Trip, List<MediaImage>)>>> getAllTrips();
  Future<Either<Failure, (Trip, List<MediaImage>)>> getTrip(TripId id);
  Future<Either<Failure, TripDetailsRes>> getTripDetails(TripId id);
  Future<Either<Failure, Trip>> updateTrip(Trip trip);
  Future<Either<Failure, void>> deleteTrip(TripId id);
  Future<Either<Failure, Trip>> createBlankTrip();
}
