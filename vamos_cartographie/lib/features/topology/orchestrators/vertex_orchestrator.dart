import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/core/type/id.dart';
import 'package:vamos_cartographie/features/graph/store/graph_store.dart';
import 'package:vamos_cartographie/features/topology/data/providers/vertex_providers.dart';
import "package:vamos_cartographie/features/graph/graph.dart";
import 'package:vamos_cartographie/features/topology/domain/entities/vertex.dart';
import 'package:vamos_cartographie/features/topology/data/repositories/vertex_repository.dart';
import 'package:vamos_cartographie/features/trips/domain/trip.dart';

part 'vertex_orchestrator.g.dart';

@riverpod
class VertexOrchestrator extends _$VertexOrchestrator {
  GraphStore get graph => ref.read(tripGraphProvider(tripId)).requireValue;
  OptimisticExecutor get executor => ref.read(optimisticExecutorProvider);
  VertexRepository get vertexRepo => ref.read(vertexRepositoryProvider);

  @override
  void build(Id<Trip> tripId) {}

  // ---------------------------------------------------------------------------
  // CREATE WAYPOINT (WITH OPTIONAL VERTEX)
  // ---------------------------------------------------------------------------

  Future<void> createVertex(LatLng latLng) async {
    late Id<Vertex> tempId;

    await executor.run(
      onApply: () {
        tempId = graph.create<Vertex>(
          (Id<Vertex> tmpId) => Vertex(id: tmpId, latLng: latLng),
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

  Future<void> deleteVertex(Id<Vertex> id) async {
    await executor.run(
      onApply: () => graph.delete<Vertex>(id),
      remote: () => vertexRepo.deleteVertex(id),
      onSuccess: (_) => graph.commitDelete(id),
      onError: () => graph.rollbackDelete(id),
    );
  }

  Future<void> moveVertex(Id<Vertex> vertexId, LatLng latLng) async {
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
