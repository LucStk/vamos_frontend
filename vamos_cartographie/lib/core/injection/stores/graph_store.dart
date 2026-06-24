import "dart:async";

import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:topology_application/patches/graph_patch_store.dart";
import "package:vamos_cartographie/features/features.dart";
import "package:topology_application/topology_application.dart";
part "graph_store.g.dart";

@riverpod
GraphStore rawGraphStore(Ref ref) => GraphStore(
  segmentObserver: ObservableNodeImpl(),
  vertexObserver: ObservableNodeImpl(),
);

@riverpod
GraphPatchStore rawPatchStore(Ref ref) =>
    GraphPatchStore(ObservableNodeImpl(), ObservableNodeImpl());
@riverpod
Stream<Map<VertexId, GraphNode<Vertex>>> vertexGraphStore(Ref ref) {
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
Stream<Map<SegmentId, GraphNode<Segment>>> segmentGraphStore(Ref ref) {
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

@riverpod
Stream<Map<SegmentId, SegmentPatch>> segmentPatchStore(Ref ref) {
  final store = ref.watch(rawPatchStoreProvider);
  final controller = StreamController<Map<SegmentId, SegmentPatch>>();
  controller.add(Map.unmodifiable(store.segmentPatches));
  void listener() => controller.add(Map.unmodifiable(store.segmentPatches));

  store.segmentObserver.addListener(listener);

  ref.onDispose(() {
    store.segmentObserver.removeListener(listener);
    controller.close();
  });

  return controller.stream;
}

@riverpod
Stream<Map<VertexId, VertexPatch>> vertexPatchStore(Ref ref) {
  final store = ref.watch(rawPatchStoreProvider);
  final controller = StreamController<Map<VertexId, VertexPatch>>();
  controller.add(Map.unmodifiable(store.vertexPatches));
  void listener() => controller.add(Map.unmodifiable(store.vertexPatches));

  store.vertexObserver.addListener(listener);

  ref.onDispose(() {
    store.vertexObserver.removeListener(listener);
    controller.close();
  });

  return controller.stream;
}
