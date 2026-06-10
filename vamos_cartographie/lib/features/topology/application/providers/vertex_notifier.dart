// features/vertexs/presentation/providers/vertexs_notifier.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/core/state/state.dart';
import 'package:vamos_cartographie/features/topology/domain/domain.dart';
import "package:vamos_cartographie/features/topology/application/services/vertex_service.dart";
part 'vertex_notifier.g.dart';

@riverpod
class VerticesNotifier extends _$VerticesNotifier with EntityNotifier<Vertex> {
  VertexService get service => ref.read(vertexServiceProvider);

  @override
  Future<Map<int, Vertex>> build(int tripId) async {
    return await service.getVertices(tripId);
  }

  Future<void> createVertex(LatLng latLng) async {
    final vertex = await service.createVertex(tripId, latLng);
    upsertLocal(vertex);
  }

  Future<void> moveVertex(int vertexId, LatLng latLng) async {
    final old = getOrThrow(vertexId);
    final n = old.copyWith(latLng: latLng);
    await optimistic(
      spec: OptimisticSpec(
        apply: () => updateLocal(n),
        rollback: () => updateLocal(old),
        reconcile: upsertLocal,
      ),
      remote: () => service.moveVertex(vertexId, latLng),
    );
  }

  // ---------------------------------------------------------------------------
  // DELETE
  // ---------------------------------------------------------------------------

  Future<void> deleteVertex(int id) async {
    final old = getOrThrow(id);
    await optimistic(
      spec: OptimisticSpec(
        apply: () => removeLocal(id),
        rollback: () => upsertLocal(old),
      ),
      remote: () => service.deleteVertex(id),
    );
  }
} // --- Providers Sélecteurs pour optimiser l'UI ---

@riverpod
Map<int, Vertex> vertexMap(Ref ref, int tripId) {
  return ref.watch(verticesProvider(tripId)).value ?? const {};
}

@riverpod
Iterable<int> vertexIds(Ref ref, int tripId) {
  return ref.watch(vertexMapProvider(tripId).select((map) => map.keys));
}

@riverpod
Vertex? vertexById(Ref ref, int tripId, int vertexId) {
  return ref.watch(vertexMapProvider(tripId).select((map) => map[vertexId]));
}
