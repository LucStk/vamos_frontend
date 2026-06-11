import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:latlong2/latlong.dart';
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
    final tx = graph.beginTx();

    late int tempId;

    await executor.run(
      onApply: () {
        tempId = graph.applyCreateTx<Vertex>(
          txId: tx,
          create: (id) => Vertex(
            id: id, // temporaire
            latLng: latLng,
          ),
        );
      },

      remote: () => vertexRepo.createVertex(tripId, latLng),

      onSuccess: (Vertex serverVertex) {
        graph.commitCreateTx<Vertex>(
          txId: tx,
          tempId: tempId,
          serverEntity: serverVertex,
        );
      },

      onError: () {
        graph.rollbackTx(tx);
      },
    );
  }

  Future<void> deleteVertex(int id) async {
    final tx = graph.beginTx();

    await executor.run(
      onApply: () {
        graph.applyDeleteTx<Vertex>(txId: tx, id: id);
      },
      remote: () => vertexRepo.deleteVertex(id),
      onSuccess: (_) => graph.commitTx(tx),
      onError: () => graph.rollbackTx(tx),
    );
  }

  Future<void> moveVertex(int vertexId, LatLng latLng) async {
    final tx = graph.beginTx();

    await executor.run(
      onApply: () {
        graph.applyTx<Vertex>(
          txId: tx,
          id: vertexId,
          mutate: (v) => v.copyWith(latLng: latLng),
        );
      },
      remote: () => vertexRepo.moveVertex(vertexId, latLng),
      onSuccess: (_) {
        graph.commitTx(tx);
      },
      onError: () {
        graph.rollbackTx(tx);
      },
    );
  }
}
