import "package:domain_core/domain_core.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:trip_domain/domain/entities/entities.dart";
import "package:trip_domain/runtime/store/graph_store.dart";
import "package:topology_application/topology_application.dart";
import "package:vamos_cartographie/core/injection/services//add_listener_to_observable.dart";
part "graph_store.g.dart";

@riverpod
GraphStore rawGraphStore(Ref ref) => GraphStore();

@riverpod
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
