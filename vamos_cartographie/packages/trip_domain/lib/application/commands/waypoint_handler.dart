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

  void loadFromRemote() async {
    waypointStore.clear();
    final result = await repo.getWaypoints(tripId);

    result.fold((failure) => throw Exception(failure.message), (
      List<Waypoint> waypoints,
    ) {
      for (final w in waypoints) {
        waypointStore.upsert(w);
      }
    });
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

  Future<Waypoint> createBlankWaypoint(
    VertexId? vertexId,
    LatLng? latLng,
  ) async {
    final result = await repo.createBlankWaypoint(tripId, vertexId, latLng);

    return result.fold((f) => throw Exception(f.message), (data) {
      waypointStore.upsert(data.$1);
      graphStore.insertVertex(data.$2);

      return data.$1;
    });
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
