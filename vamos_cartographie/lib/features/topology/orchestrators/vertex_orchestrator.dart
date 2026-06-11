import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/features/features.dart';
import 'package:vamos_cartographie/features/graph/domain/optimistic_spec.dart';
import 'package:vamos_cartographie/features/topology/data/topology_providers.dart';
import "package:vamos_cartographie/features/graph/graph.dart";
import 'package:vamos_cartographie/features/topology/domain/entities/vertex.dart';
import 'package:vamos_cartographie/features/topology/data/repositories/vertex_repository.dart';

part 'vertex_orchestrator.g.dart';

@riverpod
class WaypointTopologyOrchestrator extends _$WaypointTopologyOrchestrator {
  GraphStore get graph => ref.read(graphStoreProvider);
  OptimisticExecutor get executor => ref.read(optimisticExecutorProvider);
  VertexRepository get vertexRepo => ref.read(vertexRepositoryProvider);

  @override
  void build(int tripId) {}

  // ---------------------------------------------------------------------------
  // CREATE WAYPOINT (WITH OPTIONAL VERTEX)
  // ---------------------------------------------------------------------------

  Future<void> createVertex(LatLng latLng) async {
    final tmpId = graph.nextTempId();
    final tmpVertex = Vertex(id: tmpId, latLng: latLng);

    await executor.run(
      spec: OptimisticSpec(
        apply: () => graph.upsert<Vertex>(tmpVertex),
        rollback: () => graph.remove<Vertex>(tmpId),
        reconcile: (Vertex v) {
          graph.remove<Vertex>(tmpId);
          graph.upsert<Vertex>(v);
        },
      ),
      remote: () => vertexRepo.createVertex(tmpId, latLng),
    );
  }

  Future<void> deleteVertex(int id) async {
    final old = graph.getOrThrow<Vertex>(id);
    await executor.run(
      spec: OptimisticSpec(
        apply: () => graph.remove<Vertex>(id),
        rollback: () => graph.upsert<Vertex>(old),
        reconcile: (_) {},
      ),

      remote: () => vertexRepo.deleteVertex(id),
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
