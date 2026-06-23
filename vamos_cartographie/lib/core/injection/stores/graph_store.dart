import "dart:async";

import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:topology_engine/graph/graph_store.dart";
import "package:topology_engine/graph/nodes/graph_node.dart";
import "package:vamos_cartographie/core/injection/observable_node_impl.dart";
import "package:vamos_cartographie/features/features.dart";
part "graph_store.g.dart";

@riverpod
GraphStore rawGraphStore(Ref ref) => GraphStore(
  segmentObserver: ObservableNodeImpl(),
  vertexObserver: ObservableNodeImpl(),
);

@riverpod
Stream<Map<VertexId, GraphNode<Vertex>>> vertexGraphNode(Ref ref) {
  final store = ref.watch(rawGraphStoreProvider);
  final controller = StreamController<Map<VertexId, GraphNode<Vertex>>>();
  controller.add(Map.unmodifiable(store.vertexStore.elements));
  void listener() =>
      controller.add(Map.unmodifiable(store.vertexStore.elements));

  store.vertexStore.observableNode.addListener(listener);

  ref.onDispose(() {
    store.vertexStore.observableNode.removeListener(listener);
    controller.close();
  });

  return controller.stream;
}

@riverpod
Stream<Map<SegmentId, GraphNode<Segment>>> segmentGraphNode(Ref ref) {
  final store = ref.watch(rawGraphStoreProvider);
  final controller = StreamController<Map<SegmentId, GraphNode<Segment>>>();
  controller.add(Map.unmodifiable(store.segmentStore.elements));
  void listener() =>
      controller.add(Map.unmodifiable(store.segmentStore.elements));

  store.segmentStore.observableNode.addListener(listener);

  ref.onDispose(() {
    store.segmentStore.observableNode.removeListener(listener);
    controller.close();
  });

  return controller.stream;
}
