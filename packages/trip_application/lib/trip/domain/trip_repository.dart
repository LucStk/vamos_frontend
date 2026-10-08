import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';
import 'package:stored_file_application/stored_file_application.dart';
import 'package:user_profile_application/domain/domain.dart';
import "trip.dart";
import "../../topology/topology.dart";

abstract class TripRepository {
  Future<
    Either<
      Failure,
      List<(Trip, UserProfile, List<StoredFileRemoteModel>, TopologyRes)>
    >
  >
  getAllTrips();
  Future<Either<Failure, (Trip, List<StoredFileRemoteModel>)>> getTrip(
    TripId id,
  );
  Future<Either<Failure, TripDetailsRes>> getTripDetails(TripId id);
  Future<Either<Failure, Trip>> updateTrip(Trip trip);
  Future<Either<Failure, void>> deleteTrip(TripId id);
  Future<Either<Failure, Trip>> createBlankTrip();
}
