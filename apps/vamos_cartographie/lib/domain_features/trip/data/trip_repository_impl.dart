import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';
import 'package:latlong2/latlong.dart';
import 'package:trip_application/trip_application.dart';
import 'package:user_profile_application/user_profile_application.dart';
import 'package:vamos_cartographie/core/erreur_handler.dart';
import 'package:vamos_cartographie/domain_features/route/data/route_repository_impl.dart';
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
  Future<Either<Failure, List<TripBundle>>> getAllTripBundles() {
    return guard(() async {
      final response = await remote.getAllTrips();
      return response.trips.map((gqlTrip) {
        final trip = gqlTrip.toTripDomain();
        final images = gqlTrip.files.map((file) => file.toDomain()).toList();
        final userProfile = gqlTrip.owner.toUserProfileModel();
        final route = gqlTrip.toRouteDomain();
        final sections = gqlTrip.toSections();
        return TripBundle(
          user: userProfile,
          tripSummary: TripSummary(trip: trip, storedFiles: images),
          route: route,
          routeSections: sections,
        );
      }).toList();
    });
  }

  @override
  Future<Either<Failure, TripBundle>> getTripBundle(TripId tripId) {
    return guard(() async {
      final data = (await remote.getTripBundle(tripId: tripId));
      final trip = data.toTripDomain();
      final images = data.files.map((file) => file.toDomain()).toList();
      final userProfile = data.owner.toUserProfileModel();
      final route = data.toRouteDomain();
      final sections = data.toSections();
      return TripBundle(
        user: userProfile,
        tripSummary: TripSummary(trip: trip, storedFiles: images),
        route: route,
        routeSections: sections,
      );
    });
  }

  @override
  Future<Either<Failure, List<TripSummary>>> getMeTripsSummary() {
    return guard(() async {
      final response = await remote.getMeTrips();
      return response.meTrips.map((gqlTrip) {
        final trip = gqlTrip.toDomain();
        final images = gqlTrip.files.map((file) => file.toDomain()).toList();
        return TripSummary(trip: trip, storedFiles: images);
      }).toList();
    });
  }

  @override
  Future<Either<Failure, List<TripSummary>>> getUserTripsSummary(UserId id) {
    return guard(() async {
      final response = await remote.getUserTrips(id);
      return response.map((gqlTrip) {
        final trip = gqlTrip.toDomain();
        final images = gqlTrip.files.map((file) => file.toDomain()).toList();
        return TripSummary(trip: trip, storedFiles: images);
      }).toList();
    });
  }

  // @override
  // Future<Either<Failure, (Trip, List<StoredFileRemoteModel>)>> getTrip(
  //   Id<Trip> id,
  // ) {
  //   return guard(() async {
  //     final gqlTrip = await remote.getTripById(id: id);
  //     final trip = gqlTrip.toDomain();
  //     final images = gqlTrip.files.map((file) => file.file.toDomain()).toList();
  //     return (trip, images);
  //   });
  // }

  // ---------------------------------------------------------------------------
  // Mutations
  // ---------------------------------------------------------------------------

  @override
  Future<Either<Failure, Trip>> createBlankTrip(LatLng latLng) {
    return guard(() async {
      final result = await remote.createBlankTrip(latLng);
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

  @override
  Future<Either<Failure, void>> setTripOrigin(Id<Trip> id, LatLng origin) {
    return guardRouteEdit(() async {
      await remote.setTripOrigin(id: id, origin: origin);
    });
  }
}
