import "package:domain_core/domain_core.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:trip_domain/application/repositories/segment_repository.dart";
import "package:trip_domain/application/repositories/vertex_repository.dart";
import "package:trip_domain/domain/entities/entities.dart";
import "package:trip_domain/runtime/runtime.dart";
import "package:trip_domain/trip_domain.dart";
import "package:vamos_cartographie/core/core.dart";
import "package:vamos_cartographie/core/injection/services/add_listener_to_observable.dart";
import "package:vamos_cartographie/infrastructure/topology/data.dart";
part "graph_store.g.dart";

@riverpod
VertexRemoteDatasource vertexRemoteDatasource(Ref ref) {
  return VertexRemoteDatasource(ref.watch(clientProvider));
}

@riverpod
VertexRepository vertexRepository(Ref ref) {
  return VertexRepositoryImpl(ref.watch(vertexRemoteDatasourceProvider));
}

@riverpod
SegmentRemoteDatasource segmentRemoteDatasource(Ref ref) {
  return SegmentRemoteDatasource(ref.watch(clientProvider));
}

@riverpod
SegmentRepository segmentRepository(Ref ref) {
  return SegmentRepositoryImpl(ref.watch(segmentRemoteDatasourceProvider));
}

@Riverpod(keepAlive: true)
GraphStore rawGraphStore(Ref ref) => GraphStore();

@Riverpod(keepAlive: true)
GraphPatchStore rawGraphPatchStore(Ref ref) => GraphPatchStore();

@riverpod
ObservableCollectionStore<Vertex> vertexStore(Ref ref) {
  final graphStore = ref.watch(rawGraphStoreProvider);
  addListenerRebuild(ref, graphStore.vertexStore);
  return graphStore.vertexStore;
}

@riverpod
ObservableCollectionStore<VertexPatch> vertexPatchStore(Ref ref) {
  final graphStore = ref.watch(rawGraphPatchStoreProvider);
  addListenerRebuild(ref, graphStore.vertexPatchStore);
  return graphStore.vertexPatchStore;
}

@riverpod
ObservableCollectionStore<Segment> segmentStore(Ref ref) {
  final graphStore = ref.watch(rawGraphStoreProvider);
  addListenerRebuild(ref, graphStore.segmentStore);
  return graphStore.segmentStore;
}

@riverpod
ObservableCollectionStore<SegmentPatch> segmentPatchStore(Ref ref) {
  final graphStore = ref.watch(rawGraphPatchStoreProvider);
  addListenerRebuild(ref, graphStore.segmentPatchStore);
  return graphStore.segmentPatchStore;
}

@riverpod
Future<void> loadTopology(Ref ref, TripId tripId) async {
  final handler = ref.watch(tripHandlerProvider);
  final result = await handler.loadFromRemote();
  result.fold(
    (failure) => throw failure, // Riverpod capture ça en AsyncError
    (_) => null,
  );
}
