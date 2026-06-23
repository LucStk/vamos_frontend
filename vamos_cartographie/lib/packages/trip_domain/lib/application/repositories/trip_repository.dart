import 'package:dartz/dartz.dart';
import 'package:domain_core/failure.dart';
import 'package:trip_domain/application/repositories/attachable_media_repository.dart';
import 'package:trip_domain/domain/domain.dart';

abstract class TripRepository implements AttachableMediaRepository<Trip> {
  Future<Either<Failure, List<Trip>>> getAllTrips();
  Future<Either<Failure, Trip>> getTrip(TripId id);
  Future<Either<Failure, Trip>> createTrip(TripDraft trip);
  Future<Either<Failure, Trip>> updateTrip(TripId id, TripDraft trip);
  Future<Either<Failure, void>> deleteTrip(TripId id);
}
