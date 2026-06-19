import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/packages/topology_engine/lib/runtime/store/graph_store.dart';
import 'package:vamos_cartographie/core/injection/vertex_providers.dart';
import 'package:vamos_cartographie/packages/topology_engine/lib/application/pipeline/graph_executor.dart';
import 'package:vamos_cartographie/packages/topology_engine/lib/domain/entities/vertex.dart';
import 'package:vamos_cartographie/backend/topology/repositories/vertex_repository.dart';
import 'package:vamos_cartographie/core/injection/topology_providers.dart';
import 'package:vamos_cartographie/features/trips/domain/trip.dart';

import 'package:domain_core/domain_core.dart';
part 'vertex_handler.g.dart';

@riverpod
class VertexHandler extends _$VertexHandler {
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
