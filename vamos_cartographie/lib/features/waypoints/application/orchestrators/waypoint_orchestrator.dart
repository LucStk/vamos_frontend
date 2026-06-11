import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:vamos_cartographie/features/features.dart';
import 'package:vamos_cartographie/features/graph/store/graph_store.dart';
import "package:vamos_cartographie/features/graph/graph.dart";
import 'package:vamos_cartographie/features/topology/domain/domain.dart';
import 'package:vamos_cartographie/features/waypoints/data/providers/waypoints_providers.dart';

part 'waypoint_orchestrator.g.dart';

@riverpod
class WaypointOrchestrator extends _$WaypointOrchestrator {
  GraphStore get graph => ref.read(graphStoreProvider);
  OptimisticExecutor get executor => ref.read(optimisticExecutorProvider);
  WaypointRepository get waypointRepo => ref.read(waypointRepositoryProvider);
  @override
  void build(int tripId) {}

  // ---------------------------------------------------------------------------
  // CREATE WAYPOINT (WITH OPTIONAL VERTEX)
  // ---------------------------------------------------------------------------

  Future<void> createWaypoint(
    WaypointDraft draft,
    int? vertexId,
    LatLng? latLng,
  ) async {
    final needsVertex = vertexId == null;

    if (needsVertex && latLng == null) {
      throw Exception("CreateWaypoint Error: no vertexId and no latLng");
    }

    late int tempWaypointId;
    late int tempVertexId;

    await executor.run(
      onApply: () {
        if (needsVertex) {
          tempVertexId = graph.create<Vertex>(
            (id) => Vertex(id: id, latLng: latLng!),
          );
        } else {
          tempVertexId = vertexId;
        }

        tempWaypointId = graph.create<Waypoint>(
          (id) => draft.toWaypoint(id, tempVertexId),
        );
      },

      remote: () =>
          waypointRepo.createWaypoint(tripId, draft, vertexId, latLng),

      onSuccess: (server) {
        if (needsVertex) {
          graph.commitCreate<Vertex>(
            tempId: tempVertexId,
            serverEntity: server.vertex,
          );
        }

        graph.commitCreate<Waypoint>(
          tempId: tempWaypointId,
          serverEntity: server.waypoint,
        );
      },

      onError: () {
        if (needsVertex) {
          graph.rollbackCreate<Vertex>(tempVertexId);
        }

        graph.rollbackCreate<Waypoint>(tempWaypointId);
      },
    );
  }

  Future<void> deleteWaypoint(int id) async {
    await executor.run(
      onApply: () => graph.delete<Waypoint>(id),
      remote: () => waypointRepo.deleteWaypoint(id),
      onSuccess: (_) => graph.commitDelete(id),
      onError: () => graph.rollbackDelete(id),
    );
  }

  Future<void> updateWaypoint(
    int waypointId,
    int vertexId,
    WaypointDraft draft,
  ) async {
    late Waypoint oldValue;
    await executor.run(
      onApply: () {
        oldValue = graph.update<Waypoint>(waypointId, (Waypoint v) {
          return draft.toWaypoint(waypointId, vertexId);
        });
      },
      remote: () => waypointRepo.updateWaypoint(waypointId, draft),
      onSuccess: (serveurValue) => graph.commitUpdate(waypointId, serveurValue),
      onError: () => graph.update<Waypoint>(waypointId, (v) {
        return oldValue;
      }),
    );
  }
}
