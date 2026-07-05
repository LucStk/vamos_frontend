import 'package:domain_core/domain_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_domain/application/queries/topology_query_handler.dart';
import 'package:trip_domain/trip_domain.dart';
import 'package:vamos_cartographie/core/injection/services/add_listener_to_observable.dart';
import 'package:vamos_cartographie/core/injection/trip_domain/providers/graph_store.dart';
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
  return TopologyQueryHandler(graphStore, repo);
}

@riverpod
Future<void> loadTopology(Ref ref, TripId tripId) async {
  final handler = ref.watch(topologyQueryHandlerProvider);
  final result = await handler.loadTopology(tripId);
  result.fold(
    (failure) => throw failure, // Riverpod capture ça en AsyncError
    (_) => null,
  );
}
