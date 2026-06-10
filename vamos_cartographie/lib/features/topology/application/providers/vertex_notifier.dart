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
  late final int _tripId;

  @override
  Future<Map<int, Vertex>> build(int tripId) async {
    _tripId = tripId;
    return await service.getVertices(tripId);
  }

  Future<void> createVertex(LatLng latLng) async {
    final vertex = await service.createVertex(tripId, latLng);
    upsertLocal(vertex);
  }

  Future<void> moveVertex(int vertexId, LatLng latLng) async {
    final existing = current[vertexId];
    if (existing == null) return;
    final o = existing.copyWith(latLng: latLng);
    await optimistic(
      optimisticCommand: Update(o),
      remote: () => service.moveVertex(vertexId, latLng),
      onSuccess: (server) => upsertLocal(server),
    );
  }

  // ---------------------------------------------------------------------------
  // DELETE
  // ---------------------------------------------------------------------------

  Future<void> deleteVertex(int id) async {
    await optimistic(
      optimisticCommand: Remove(id),
      remote: () => service.deleteVertex(id),
      onSuccess: (_) => removeLocal(id),
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
