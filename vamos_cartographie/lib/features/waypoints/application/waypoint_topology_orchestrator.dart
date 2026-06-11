import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/features/features.dart';
import 'package:vamos_cartographie/features/topology/data/topology_providers.dart';
import "package:vamos_cartographie/features/graph/graph.dart";
import 'package:vamos_cartographie/features/topology/domain/entities/vertex.dart';
import 'package:vamos_cartographie/features/topology/data/repositories/vertex_repository.dart';

part 'waypoint_topology_orchestrator.g.dart';

@riverpod
class WaypointTopologyOrchestrator extends _$WaypointTopologyOrchestrator {
  OptimisticGraphStore get graph => ref.read(graphStoreProvider);
  OptimisticExecutor get executor => ref.read(optimisticExecutorProvider);
  WaypointRepository get waypointRepo => ref.read(waypointRepositoryProvider);
  VertexRepository get vertexRepo => ref.read(vertexRepositoryProvider);

  @override
  void build(int tripId) {}

  // ---------------------------------------------------------------------------
  // CREATE WAYPOINT (WITH OPTIONAL VERTEX)
  // ---------------------------------------------------------------------------
  Future<void> createWaypoint(WaypointDraft draft, LatLng? latLng) async {
    final tx = graph.beginTx();

    late int waypointTempId;
    late int vertexTempId;

    await executor.run(
      onApply: () {
        vertexTempId = graph.nextTempId();
        waypointTempId = graph.nextTempId();

        graph.createWaypointOptimistic(
          waypointTempId: waypointTempId,
          vertexTempId: vertexTempId,
          draft: draft,
          latLng: latLng,
        );
      },

      remote: () => waypointRepo.createWaypoint(tripId, draft, latLng),

      onSuccess: (result) {
        graph.commitCreateWaypoint(
          waypointTempId: waypointTempId,
          vertexTempId: vertexTempId,
          serverWaypoint: result.waypoint,
          serverVertex: result.vertex,
        );
      },

      onError: () {
        graph.rollbackTx(tx);
      },
    );
  }

  Future<void> updateWaypoint(int id, WaypointDraft draft) async {
    final old = graph.getOrThrow<Waypoint>(id);

    await executor.run(
      spec: OptimisticSpec(
        apply: () => graph.update<Waypoint>(draft.toWaypoint(id)),
        rollback: () => graph.update(old),
        reconcile: (wp) => graph.upsert<Waypoint>(wp),
      ),
      remote: () => waypointRepo.updateWaypoint(id, draft),
    );
  }

  Future<void> deleteWaypoint(int id) async {
    final old = graph.getOrThrow<Waypoint>(id);
    await executor.run(
      spec: OptimisticSpec(
        apply: () => graph.remove<Waypoint>(id),
        rollback: () => graph.upsert<Waypoint>(old),
        reconcile: (_) {},
      ),

      remote: () => waypointRepo.deleteWaypoint(id),
    );
  }

  Future<void> moveVertex(int vertexId, LatLng latLng) async {
    final old = graph.getOrThrow<Vertex>(vertexId);
    await executor.run(
      spec: OptimisticSpec(
        apply: () => graph.update<Vertex>(old.copyWith(latLng: latLng)),
        rollback: () => graph.update(old),
        reconcile: (vertex) => graph.upsert<Vertex>(vertex),
      ),
      remote: () => vertexRepo.moveVertex(vertexId, latLng),
    );
  }
}
