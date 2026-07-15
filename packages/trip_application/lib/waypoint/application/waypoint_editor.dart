import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';
import 'package:trip_application/trip_application.dart';

mixin WaypointEditor on OptimisticRunner<WaypointStore> {
  WaypointRepository get waypointRepo;
  TripId get tripId;

  Future<Either<Failure, Waypoint>> updateWaypoint(Waypoint waypoint) async {
    return await run(
      onApply: (gs) => gs..waypointStore.patchNode(waypoint.createPatch()),
      remote: () => waypointRepo.updateWaypoint(waypoint),
      onSuccess: (gs, serveurValue) => gs..setWaypoint(serveurValue),
      onError: (gs, Failure failure) => gs..rollbackWaypoint(waypoint.id),
    );
  }

  Future<Either<Failure, WaypointCreateBlankRes>> createBlankWaypointFromVertex(
    VertexId vertexId,
  ) async {
    return await run(
      onApply: (gs) => gs,
      remote: () =>
          waypointRepo.createBlankWaypointFromVertex(tripId, vertexId),
      onSuccess: (gs, data) => gs..setWaypoint(data.waypoint),
    );
  }

  // Future<Either<Failure, WaypointCreateBlankRes>>
  // createBlankWaypointFromPosition(LatLng latLng) async {
  //   return await executor.run(
  //     onApply: () {},
  //     remote: () =>
  //         waypointRepo.createBlankWaypointFromPosition(tripId, latLng),
  //     onSuccess: (data) {
  //       waypointStore.upsert(data.waypoint);
  //       graphStore.upsertVertex(data.vertex);
  //     },
  //     onError: (Failure failure) {},
  //   );
  // }

  Future<Either<Failure, void>> deleteWaypoint(WaypointId id) async {
    return await run(
      onApply: (gs) => gs,
      remote: () => waypointRepo.deleteWaypoint(id),
    );
  }
}
