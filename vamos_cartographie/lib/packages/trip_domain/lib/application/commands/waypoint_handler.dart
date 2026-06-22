import 'package:domain_core/optimitic_executor.dart';
import 'package:topology_engine/topology_engine.dart';
import 'package:trip_domain/application/repositories/waypoint_repository.dart';
import 'package:trip_domain/domain/domain.dart';
import 'package:trip_domain/runtime/store/waypoint_store.dart';

class WaypointHandler {
  WaypointStore waypointStore;
  WaypointRepository repo;
  OptimisticExecutor executor;
  TripId tripId;

  WaypointHandler(this.tripId, this.waypointStore, this.repo, this.executor);

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

  Future<void> updateWaypoint(
    WaypointId waypointId,
    VertexId vertexId,
    WaypointDraft draft,
  ) async {
    final Waypoint oldValue = waypointStore.getRequired(waypointId);
    await executor.run(
      onApply: () =>
          waypointStore.upsert(draft.toWaypoint(waypointId, vertexId)),
      remote: () => repo.updateWaypoint(waypointId, draft),
      onSuccess: (serveurValue) => waypointStore.upsert(serveurValue),
      onError: () => waypointStore.upsert(oldValue),
    );
  }

  Future<void> deleteWaypoint(WaypointId id) async {
    final old = waypointStore.getRequired(id);
    await executor.run(
      onApply: () => waypointStore.remove(id),
      remote: () => repo.deleteWaypoint(id),
      onSuccess: (_) {},
      onError: () => waypointStore.upsert(old),
    );
  }
}
