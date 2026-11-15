import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';
import 'package:trip_application/trip_application.dart';
import "package:latlong2/latlong.dart";
import 'package:vamos_cartographie/core/erreur_handler.dart';
import 'package:vamos_cartographie/domain_features/waypoint/data/mappers/stay_mappers.dart';
import 'package:vamos_cartographie/domain_features/waypoint/waypoint.dart';

class WaypointRepositoryImpl extends WaypointRepository {
  final WaypointRemoteDatasource remote;

  WaypointRepositoryImpl(this.remote);

  @override
  Future<Either<Failure, WaypointRemoteModel>> createBlankWaypoint({
    required TripId tripId,
    required LatLng latLng,
  }) {
    return guard(() async {
      final gqlResult = await remote.createBlankWaypointFromPosition(
        tripId: tripId,
        latLng: latLng,
      );
      return gqlResult.toDomain();
    });
  }

  @override
  Future<Either<Failure, WaypointRemoteModel>> updateWaypoint(
    WaypointFields waypoint,
    WaypointChanges changes,
  ) {
    return guard(() async {
      final input = waypoint.toGQLUpdateInput(
        anchorEdited: changes.anchorEdited,
        moved: changes.moved,
      );
      final gqlResult = await remote.updateWaypoint(
        id: waypoint.id,
        input: input,
      );
      return gqlResult.toDomain();
    });
  }

  @override
  Future<Either<Failure, void>> deleteWaypoint(WaypointId id) {
    return guard(() async {
      await remote.deleteWaypoint(id: id);
    });
  }

  @override
  Future<Either<Failure, WaypointRemoteModel>> setStay(
    WaypointId waypointId,
    int nights,
  ) => guard(
    () async => (await remote.setStay(
      waypointId: waypointId,
      nights: nights,
    )).toDomain(),
  );

  @override
  Future<Either<Failure, WaypointRemoteModel>> clearStay(
    WaypointId waypointId,
  ) => guard(
    () async => (await remote.clearStay(waypointId: waypointId)).toDomain(),
  );

  @override
  Future<Either<Failure, DayNote?>> setDayNote({
    required Id<Trip> tripId,
    required StayId stayId,
    required int offset,
    required String title,
    required String notes,
  }) => guard(
    () async => (await remote.setStayDayNote(
      tripId: tripId,
      stayId: stayId,
      offset: offset,
      title: title,
      notes: notes,
    ))?.toDomain(),
  );
  @override
  Future<Either<Failure, DayNote?>> setFinalDayNote({
    required Id<Trip> tripId,
    required int offset,
    required String title,
    required String notes,
  }) => guard(
    () async => (await remote.setFinalDayNote(
      tripId: tripId,
      title: title,
      notes: notes,
    ))?.toDomain(),
  );
  @override
  Future<Either<Failure, DayNote?>> finalDayNote(Id<Trip> tripId) => guard(
    () async => (await remote.finalDayNote(tripId: tripId))?.toDomain(),
  );
}
