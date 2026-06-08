// features/vertexs/presentation/providers/vertexs_notifier.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/features/topology/domain/domain.dart';
import 'package:vamos_cartographie/features/topology/data/repositories/vertex_repository.dart';
import 'package:vamos_cartographie/features/topology/data/topology_providers.dart';
import 'package:vamos_cartographie/core/state/entity_store_helpers.dart';
part 'vertex_notifier.g.dart';

@riverpod
class VerticesNotifier extends _$VerticesNotifier {
  VertexRepository get repository => ref.read(vertexRepositoryProvider);
  late final int _tripId;
  // ---------------------------------------------------------------------------
  // STATE ACCESS
  // ---------------------------------------------------------------------------

  Map<int, Vertex> get _current => state.value ?? <int, Vertex>{};

  void _emit(Map<int, Vertex> next) {
    state = AsyncData(next);
  }

  // ---------------------------------------------------------------------------
  // LIFECYCLE
  // ---------------------------------------------------------------------------

  @override
  Future<Map<int, Vertex>> build(int tripId) async {
    _tripId = tripId;
    return _load();
  }

  Future<Map<int, Vertex>> _load() async {
    final result = await repository.getVertices(_tripId);

    return result.fold(
      (failure) => throw Exception(failure.message),
      (vertices) => {for (final vertex in vertices) vertex.id: vertex},
    );
  }

  // ---------------------------------------------------------------------------
  // CREATE
  // ---------------------------------------------------------------------------

  Future<void> createVertex(LatLng latLng) async {
    final result = await repository.createVertex(tripId, latLng);

    result.fold((_) {}, (w) {
      final next = EntityStoreHelpers.set(_current, w.id, w);
      _emit(next);
    });
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

    final result = await repository.moveVertex(vertexId, latLng);

    result.fold(
      (_) => _emit(previous), // rollback
      (server) {
        final next = EntityStoreHelpers.set(_current, server.id, server);
        _emit(next);
      },
    );
  }

  // ---------------------------------------------------------------------------
  // DELETE
  // ---------------------------------------------------------------------------

  Future<void> deleteVertex(int id) async {
    final previous = _current;

    _emit(EntityStoreHelpers.remove(_current, id));

    final result = await repository.deleteVertex(id);

    result.fold(
      (_) => _emit(previous), // rollback
      (_) {},
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
