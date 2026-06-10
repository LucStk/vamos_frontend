// features/vertexs/presentation/providers/vertexs_notifier.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/features/topology/domain/domain.dart';
import 'package:vamos_cartographie/features/topology/data/repositories/vertex_repository.dart';
import 'package:vamos_cartographie/features/topology/data/topology_providers.dart';
import 'package:vamos_cartographie/core/state/entity_store_helpers.dart';
import "package:vamos_cartographie/features/topology/application/services/vertex_service.dart";
part 'vertex_notifier.g.dart';

@riverpod
class VerticesNotifier extends _$VerticesNotifier {
  VertexService get service => ref.read(vertexServiceProvider);
  late final int _tripId;
  // ---------------------------------------------------------------------------
  // STATE ACCESS
  // ---------------------------------------------------------------------------

  Map<int, Vertex> get _current => state.value ?? <int, Vertex>{};

  void _emit(Map<int, Vertex> next) {
    state = AsyncData(next);
  }

  void upsertLocal(Vertex vertex) {
    _emit(EntityStoreHelpers.set(_current, vertex.id, vertex));
  }
  // ---------------------------------------------------------------------------
  // LIFECYCLE
  // ---------------------------------------------------------------------------

  @override
  Future<Map<int, Vertex>> build(int tripId) async {
    _tripId = tripId;
    return await service.getVertices(tripId);
  }

  Future<void> createVertex(LatLng latLng) async {
    final vertex = await service.createVertex(tripId, latLng);
    _emit(EntityStoreHelpers.set(_current, vertex.id, vertex));
  }

  // ---------------------------------------------------------------------------
  // UPDATE (OPTIMISTIC)
  // ---------------------------------------------------------------------------

  Future<void> moveVertex(int vertexId, LatLng latLng) async {
    final previous = _current;

    final existing = previous[vertexId];
    if (existing == null) return;

    final optimistic = existing.copyWith(latLng: latLng);

    _emit(EntityStoreHelpers.update(previous, vertexId, optimistic));

    try {
      final server = await service.moveVertex(vertexId, latLng);
      _emit(EntityStoreHelpers.set(_current, server.id, server));
    } catch (_) {
      _emit(previous); // rollback
    }
  }

  // ---------------------------------------------------------------------------
  // DELETE
  // ---------------------------------------------------------------------------

  Future<void> deleteVertex(int id) async {
    final previous = _current;
    _emit(EntityStoreHelpers.remove(_current, id));
    try {
      await service.deleteVertex(id);
    } catch (_) {
      _emit(previous);
    }
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
