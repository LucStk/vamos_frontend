import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';
import 'package:stored_file_application/stored_file_application.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/stored_file/data/mappers/stored_file_mappers.dart';
import 'package:vamos_cartographie/topology/data/mappers/segment_mappers.dart';
import 'package:vamos_cartographie/topology/data/mappers/vertex_mappers.dart';
import 'package:vamos_cartographie/waypoint/data/data.dart';
import 'trip_remote_datasource.dart';
import 'trip_mappers.dart';
import 'package:vamos_cartographie/core/core.dart';

class TripRepositoryImpl extends TripRepository {
  TripRepositoryImpl(this.remote);

  final TripRemoteDatasource remote;

  // ---------------------------------------------------------------------------
  // Queries
  // ---------------------------------------------------------------------------

  @override
  Future<
    Either<Failure, List<(Trip, List<StoredFileRemoteModel>, TopologyRes)>>
  >
  getAllTrips() {
    return guard(() async {
      final response = await remote.getAllTrips();

      return response.trips.map((gqlTrip) {
        final trip = gqlTrip.toDomain();
        final images = gqlTrip.files.map((file) => file.toDomain()).toList();
        final topology = gqlTrip.topology.toDomain();
        return (trip, images, topology);
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
