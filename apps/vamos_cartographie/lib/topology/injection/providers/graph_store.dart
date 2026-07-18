import "package:domain_core/domain_core.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

import "package:trip_application/trip_application.dart";
import "package:vamos_cartographie/core/core.dart";
import "package:vamos_cartographie/core/injection/mutation_queue_provider.dart";
import "package:vamos_cartographie/topology/data/topology.dart";
part "graph_store.g.dart";

@riverpod
SegmentRemoteDatasource segmentRemoteDatasource(Ref ref) {
  return SegmentRemoteDatasource(ref.watch(clientProvider));
}

@riverpod
SegmentRepository segmentRepository(Ref ref) {
  return SegmentRepositoryImpl(ref.watch(segmentRemoteDatasourceProvider));
}

@riverpod
VertexRemoteDatasource vertexRemoteDatasource(Ref ref) {
  return VertexRemoteDatasource(ref.watch(clientProvider));
}

@riverpod
VertexRepository vertexRepository(Ref ref) {
  return VertexRepositoryImpl(ref.watch(vertexRemoteDatasourceProvider));
}

@riverpod
TopologyRemoteDatasource topologyRemoteDatasource(Ref ref) {
  return TopologyRemoteDatasource(ref.watch(clientProvider));
}

@riverpod
TopologyRepository topologyRepository(Ref ref) {
  return TopologyRepositoryImpl(ref.watch(topologyRemoteDatasourceProvider));
}

@Riverpod(keepAlive: true)
class GraphStoreNotifier extends _$GraphStoreNotifier
    with OptimisticRunner<GraphStore>, GraphEditor {
  @override
  GraphStore build(TripId tripId) => GraphStore.initial();

  // Injection des dépendances requises par le mixin TopologyHandler
  @override
  SegmentRepository get segmentRepo => ref.read(segmentRepositoryProvider);

  @override
  MutationQueue get mutationQueue => ref.read(mutationQueueProvider);

  @override
  VertexRepository get vertexRepo => ref.read(vertexRepositoryProvider);

  @override
  ErrorLogger? get errorLogger => null;
}

@riverpod
GraphCollectionStore<VertexFields> vertexStore(Ref ref, TripId tripId) {
  print("rebuild vertexStore");
  return ref.watch(graphStoreProvider(tripId).select((gs) => gs.vertexStore));
}

@riverpod
GraphCollectionStore<SegmentFields> segmentStore(Ref ref, TripId tripId) {
  return ref.watch(graphStoreProvider(tripId).select((gs) => gs.segmentStore));
}
