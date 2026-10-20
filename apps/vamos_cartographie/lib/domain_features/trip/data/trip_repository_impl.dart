import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';
import 'package:stored_file_application/stored_file_application.dart';
import 'package:trip_application/trip_application.dart';
import 'package:user_profile_application/user_profile_application.dart';
import 'package:vamos_cartographie/core/erreur_handler.dart';
import 'package:vamos_cartographie/domain_features/stored_file/data/mappers/stored_file_mappers.dart';
import 'package:vamos_cartographie/domain_features/trip/data/trip_mappers.dart';
import 'package:vamos_cartographie/domain_features/trip/data/trip_remote_datasource.dart';
import 'package:vamos_cartographie/domain_features/user_profile/data/user_profile_mappers.dart';

class TripRepositoryImpl extends TripRepository {
  TripRepositoryImpl(this.remote);

  final TripRemoteDatasource remote;

  // ---------------------------------------------------------------------------
  // Queries
  // ---------------------------------------------------------------------------

  @override
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
  getAllTrips() {
    return guard(() async {
      final response = await remote.getAllTrips();
      return response.trips.map((gqlTrip) {
        final trip = gqlTrip.toTripDomain();
        final images = gqlTrip.files.map((file) => file.toDomain()).toList();
        final userProfile = gqlTrip.owner.toUserProfileModel();
        final route = gqlTrip.toRouteDomain();
        final sections = gqlTrip.toSections();
        return (trip, userProfile, images, route, sections);
      }).toList();
    });
  }

  @override
  Future<Either<Failure, List<(Trip, List<StoredFileRemoteModel>)>>>
  getMeTrips() {
    return guard(() async {
      final response = await remote.getMeTrips();
      return response.meTrips.map((gqlTrip) {
        final trip = gqlTrip.toDomain();
        final images = gqlTrip.files.map((file) => file.toDomain()).toList();
        return (trip, images);
      }).toList();
    });
  }

  @override
  Future<Either<Failure, List<(Trip, List<StoredFileRemoteModel>)>>>
  getUserTrips(UserId id) {
    return guard(() async {
      final response = await remote.getUserTrips(id);
      return response.userTrips.map((gqlTrip) {
        final trip = gqlTrip.toDomain();
        final images = gqlTrip.files.map((file) => file.toDomain()).toList();
        return (trip, images);
      }).toList();
    });
  }

  @override
  Future<Either<Failure, (Trip, List<StoredFileRemoteModel>)>> getTrip(
    Id<Trip> id,
  ) {
    return guard(() async {
      final gqlTrip = await remote.getTripById(id: id);
      final trip = gqlTrip.toDomain();
      final images = gqlTrip.files.map((file) => file.file.toDomain()).toList();
      return (trip, images);
    });
  }

  // ---------------------------------------------------------------------------
  // Mutations
  // ---------------------------------------------------------------------------

  @override
  Future<Either<Failure, Trip>> createBlankTrip() {
    return guard(() async {
      final result = await remote.createBlankTrip();
      return result.toDomain();
    });
  }

  @override
  Future<Either<Failure, Trip>> updateTrip(Trip trip) {
    return guard(() async {
      final input = trip.toGQLUpdateInput();
      final result = await remote.updateTrip(id: trip.id, input: input);

      return result.toDomain();
    });
  }

  @override
  Future<Either<Failure, void>> deleteTrip(Id<Trip> id) {
    return guard(() async {
      await remote.deleteTrip(id: id);
    });
  }
}
