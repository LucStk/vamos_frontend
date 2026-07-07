import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';
import 'package:domain_core/optimitic_executor.dart';
import 'package:latlong2/latlong.dart';
import 'package:trip_domain/domain/types/topology_res.dart';
import 'package:trip_domain/trip_domain.dart';

class WaypointHandler {
  WaypointStore waypointStore;
  GraphStore graphStore;
  WaypointRepository repo;
  OptimisticExecutor executor;
  TripId tripId;

  WaypointHandler(
    this.tripId,
    this.waypointStore,
    this.graphStore,
    this.repo,
    this.executor,
  );

  Future<Either<Failure, List<Waypoint>>> loadFromRemote() async {
    waypointStore.clear();
    return await executor.run(
      onApply: () {},
      remote: () => repo.getWaypoints(tripId),
      onSuccess: (data) {
        for (final w in data) {
          waypointStore.upsert(w);
        }
      },
      onError: (f) {},
    );
  }

  Future<Either<Failure, Waypoint>> updateWaypoint(Waypoint waypoint) async {
    final Waypoint oldValue = waypointStore.getRequired(waypoint.id);
    return await executor.run(
      onApply: () => waypointStore.upsert(waypoint),
      remote: () => repo.updateWaypoint(waypoint),
      onSuccess: (serveurValue) => waypointStore.upsert(serveurValue),
      onError: (Failure failure) => waypointStore.upsert(oldValue),
    );
  }

  Future<Either<Failure, WaypointCreateBlankRes>> createBlankWaypointFromVertex(
    VertexId vertexId,
  ) async {
    return await executor.run(
      onApply: () {},
      remote: () => repo.createBlankWaypointFromVertex(tripId, vertexId),
      onSuccess: (data) {
        waypointStore.upsert(data.waypoint);
        graphStore.insertVertex(data.vertex);
      },
      onError: (Failure failure) {},
    );
  }

  Future<Either<Failure, WaypointCreateBlankRes>>
  createBlankWaypointFromPosition(LatLng latLng) async {
    return await executor.run(
      onApply: () {},
      remote: () => repo.createBlankWaypointFromPosition(tripId, latLng),
      onSuccess: (data) {
        waypointStore.upsert(data.waypoint);
        graphStore.insertVertex(data.vertex);
      },
      onError: (Failure failure) {},
    );
  }

  Future<void> deleteWaypoint(WaypointId id) async {
    final old = waypointStore.getRequired(id);
    await executor.run(
      onApply: () => waypointStore.remove(id),
      remote: () => repo.deleteWaypoint(id),
      onSuccess: (_) {},
      onError: (Failure failure) => waypointStore.upsert(old),
    );
  }
}
