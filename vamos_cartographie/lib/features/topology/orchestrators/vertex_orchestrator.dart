import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/features/graph/store/graph_store.dart';
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
    late int tempId;

    await executor.run(
      onApply: () {
        tempId = graph.create<Vertex>(
          (int tmpId) => Vertex(id: tmpId, latLng: latLng),
        );
      },
      remote: () => vertexRepo.createVertex(tripId, latLng),
      onSuccess: (Vertex serverVertex) => graph.commitCreate<Vertex>(
        tempId: tempId,
        serverEntity: serverVertex,
      ),
      onError: () {
        graph.rollbackCreate<Vertex>(tempId);
      },
    );
  }

  Future<void> deleteVertex(int id) async {
    await executor.run(
      onApply: () => graph.delete<Vertex>(id),
      remote: () => vertexRepo.deleteVertex(id),
      onSuccess: (_) => graph.commitDelete(id),
      onError: () => graph.rollbackDelete(id),
    );
  }

  Future<void> moveVertex(int vertexId, LatLng latLng) async {
    late Vertex oldValue;
    await executor.run(
      onApply: () {
        oldValue = graph.update<Vertex>(vertexId, (Vertex v) {
          return v.copyWith(latLng: latLng);
        });
      },
      remote: () => vertexRepo.moveVertex(vertexId, latLng),
      onSuccess: (serveurValue) => graph.commitUpdate(vertexId, serveurValue),
      onError: () => graph.update<Vertex>(vertexId, (v) {
        return oldValue;
      }),
    );
  }
}
