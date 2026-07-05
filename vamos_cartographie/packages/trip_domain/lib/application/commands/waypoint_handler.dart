import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';
import 'package:domain_core/optimitic_executor.dart';
import 'package:latlong2/latlong.dart';
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

  Future<void> updateWaypoint(Waypoint waypoint) async {
    final Waypoint oldValue = waypointStore.getRequired(waypoint.id);
    await executor.run(
      onApply: () => waypointStore.upsert(waypoint),
      remote: () => repo.updateWaypoint(waypoint),
      onSuccess: (serveurValue) => waypointStore.upsert(serveurValue),
      onError: (Failure failure) => waypointStore.upsert(oldValue),
    );
  }

  Future<Either<Failure, (Waypoint, Vertex)>> createBlankWaypoint(
    VertexId? vertexId,
    LatLng? latLng,
  ) async {
    return await executor.run(
      onApply: () {},
      remote: () => repo.createBlankWaypoint(tripId, vertexId, latLng),
      onSuccess: (data) {
        waypointStore.upsert(data.$1);
        graphStore.insertVertex(data.$2);
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
