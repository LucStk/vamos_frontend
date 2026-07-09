import 'package:domain_core/domain_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/core/injection/optimistic_executor_provider.dart';
import 'package:vamos_cartographie/core/services/add_listener_to_observable.dart';
import 'package:vamos_cartographie/topology/injection/injection.dart';
part 'graph_queries.g.dart';

@riverpod
Vertex? vertex(Ref ref, VertexId id) {
  final ObservableCollectionStore<Vertex> vertexStore = ref.watch(
    vertexStoreProvider,
  );

  final node = vertexStore.getNode(id);
  if (node == null) {
    return null;
  }
  addListenerRebuild(ref, node); // Rebuild si change
  print("vertex $id rebuild");
  return node.value;
}

@riverpod
VertexPatch? vertexPatch(Ref ref, Id<VertexPatch> id) {
  final ObservableCollectionStore<VertexPatch> vertexStore = ref.watch(
    vertexPatchStoreProvider,
  );
  final node = vertexStore.getNode(id);
  if (node == null) {
    return null;
  }
  addListenerRebuild(ref, node); // Rebuild si change
  print("vertexPatch $id rebuild");
  return node.value;
}

@riverpod
Segment? segment(Ref ref, SegmentId id) {
  final ObservableCollectionStore<Segment> segStore = ref.watch(
    segmentStoreProvider,
  );
  final node = segStore.getNode(id);
  if (node == null) {
    return null;
  }
  addListenerRebuild(ref, node); // Rebuild si change
  return node.value;
}

@riverpod
SegmentPatch? segmentPatch(Ref ref, Id<SegmentPatch> id) {
  final ObservableCollectionStore<SegmentPatch> segStore = ref.watch(
    segmentPatchStoreProvider,
  );
  final node = segStore.getNode(id);
  if (node == null) {
    return null;
  }
  addListenerRebuild(ref, node); // Rebuild si change
  return node.value;
}

@riverpod
TopologyQueryHandler topologyQueryHandler(Ref ref) {
  final graphStore = ref.read(rawGraphStoreProvider);
  final repo = ref.read(topologyRepositoryProvider);
  final executor = ref.read(optimisticExecutorProvider);
  return TopologyQueryHandler(graphStore, repo, executor);
}

@riverpod
Future<void> loadTopology(Ref ref, TripId tripId) async {
  final handler = ref.watch(topologyQueryHandlerProvider);
  await handler.loadTopology(tripId);
}
