// features/vertexs/presentation/providers/vertexs_notifier.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/features/graph/graph.dart';
import 'package:vamos_cartographie/features/topology/data/topology_providers.dart';
import 'package:vamos_cartographie/features/topology/domain/domain.dart';
part 'vertex_notifier.g.dart';

@riverpod
class VerticesNotifier extends _$VerticesNotifier {
  GraphStore get graph => ref.read(graphStoreProvider);

  Future<Map<int, Vertex>> _load() async {
    final repo = ref.read(vertexRepositoryProvider);
    final result = await repo.getVertices(tripId);
    return result.fold(
      (failure) => throw Exception(failure.message),
      (trips) => {for (final trip in trips) trip.id: trip},
    );
  }

  @override
  Future<Map<int, Vertex>> build(int tripId) async {
    return await _load();
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
