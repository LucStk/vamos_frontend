import "package:domain_core/domain_core.dart";
import "package:flutter/rendering.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

import "package:trip_domain/trip_domain.dart";
import "package:vamos_cartographie/core/core.dart";
import "package:vamos_cartographie/core/injection/services/add_listener_to_observable.dart";
import "/core/infrastructure/infrastructure.dart";
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

@riverpod
TopologyRemoteDatasource topologyRemoteDatasource(Ref ref) {
  return TopologyRemoteDatasource(ref.watch(clientProvider));
}

@riverpod
TopologyRepository topologyRepository(Ref ref) {
  return TopologyRepositoryImpl(ref.watch(topologyRemoteDatasourceProvider));
}

@Riverpod(keepAlive: true)
GraphStore rawGraphStore(Ref ref) => GraphStore();

@Riverpod(keepAlive: true)
GraphPatchStore rawGraphPatchStore(Ref ref) => GraphPatchStore();

@riverpod
ObservableCollectionStore<Vertex> vertexStore(Ref ref) {
  final graphStore = ref.watch(rawGraphStoreProvider);

  debugPrint("vertexStore rebuild");
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
