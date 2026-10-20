import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';
import 'package:stored_file_application/stored_file_application.dart';
import 'package:trip_application/src/route/domain/route.dart';
import 'package:trip_application/src/route/domain/route_section.dart';
import 'package:trip_application/src/trip/domain/trip.dart';
import 'package:user_profile_application/domain/domain.dart';

abstract class TripRepository {
  Future<
    Either<
      Failure,
      List<
        (
          Trip,
          UserProfile,
          List<StoredFileRemoteModel>,
          RouteRemoteModel,
          Iterable<RouteSectionRemoteModel>,
        )
      >
    >
  >
  getAllTrips();
  Future<Either<Failure, (Trip, List<StoredFileRemoteModel>)>> getTrip(
    TripId id,
  );
  Future<Either<Failure, List<(Trip, List<StoredFileRemoteModel>)>>>
  getUserTrips(UserId id);
  Future<Either<Failure, List<(Trip, List<StoredFileRemoteModel>)>>>
  getMeTrips();
  Future<Either<Failure, Trip>> updateTrip(Trip trip);
  Future<Either<Failure, void>> deleteTrip(TripId id);
  Future<Either<Failure, Trip>> createBlankTrip();
}
