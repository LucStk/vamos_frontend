import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';
import 'package:stored_file_application/stored_file_application.dart';
import 'package:trip_application/trip_application.dart';
import 'package:user_profile_application/user_profile_application.dart';
import '/core/erreur_handler.dart';
import '../../stored_file/data/mappers/stored_file_mappers.dart';
import '../../topology/data/mappers/segment_mappers.dart';
import '../../topology/data/mappers/vertex_mappers.dart';
import '../../user_profile/data/data.dart';
import '../../waypoint/data/mappers/mappers.dart';
import 'trip_mappers.dart';
import 'trip_remote_datasource.dart';

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
      List<(Trip, UserProfile, List<StoredFileRemoteModel>, TopologyRes)>
    >
  >
  getAllTrips() {
    return guard(() async {
      final response = await remote.getAllTrips();

      return response.trips.map((gqlTrip) {
        final trip = gqlTrip.toDomain();
        final images = gqlTrip.files.map((file) => file.toDomain()).toList();
        final topology = gqlTrip.topology.toDomain();
        final userProfile = gqlTrip.owner.toUserProfileModel();
        return (trip, userProfile, images, topology);
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

  @override
  Future<Either<Failure, TripDetailsRes>> getTripDetails(Id<Trip> id) {
    return guard(() async {
      final gqlTrip = await remote.getTripDetails(id: id);

      final vertices = gqlTrip.topology.vertices
          .map((vertex) => vertex.toDomain())
          .toList();

      final segments = gqlTrip.topology.segments
          .map((segment) => segment.toDomain())
          .toList();

      final waypoints = gqlTrip.waypoints
          .map(
            (waypoint) => (
              waypoint.toDomain(),
              waypoint.files.map((file) => file.file.toDomain()).toList(),
            ),
          )
          .toList();

      return TripDetailsRes(vertices, segments, waypoints);
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
