// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'graph_store.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(rawGraphStore)
final rawGraphStoreProvider = RawGraphStoreProvider._();

final class RawGraphStoreProvider
    extends $FunctionalProvider<GraphStore, GraphStore, GraphStore>
    with $Provider<GraphStore> {
  RawGraphStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'rawGraphStoreProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$rawGraphStoreHash();

  @$internal
  @override
  $ProviderElement<GraphStore> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GraphStore create(Ref ref) {
    return rawGraphStore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GraphStore value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GraphStore>(value),
    );
  }
}

String _$rawGraphStoreHash() => r'1f381479849b7aa0f0856b211cb6a9c7b8e39b32';

@ProviderFor(vertexGraphNode)
final vertexGraphNodeProvider = VertexGraphNodeProvider._();

final class VertexGraphNodeProvider
    extends
        $FunctionalProvider<
          AsyncValue<Map<VertexId, GraphNode<Vertex>>>,
          Map<VertexId, GraphNode<Vertex>>,
          Stream<Map<VertexId, GraphNode<Vertex>>>
        >
    with
        $FutureModifier<Map<VertexId, GraphNode<Vertex>>>,
        $StreamProvider<Map<VertexId, GraphNode<Vertex>>> {
  VertexGraphNodeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'vertexGraphNodeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$vertexGraphNodeHash();

  @$internal
  @override
  $StreamProviderElement<Map<VertexId, GraphNode<Vertex>>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<Map<VertexId, GraphNode<Vertex>>> create(Ref ref) {
    return vertexGraphNode(ref);
  }
}

String _$vertexGraphNodeHash() => r'579ec372f58058ab27d2af8575ddf22ed09cb45d';

@ProviderFor(segmentGraphNode)
final segmentGraphNodeProvider = SegmentGraphNodeProvider._();

final class SegmentGraphNodeProvider
    extends
        $FunctionalProvider<
          AsyncValue<Map<SegmentId, GraphNode<Segment>>>,
          Map<SegmentId, GraphNode<Segment>>,
          Stream<Map<SegmentId, GraphNode<Segment>>>
        >
    with
        $FutureModifier<Map<SegmentId, GraphNode<Segment>>>,
        $StreamProvider<Map<SegmentId, GraphNode<Segment>>> {
  SegmentGraphNodeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'segmentGraphNodeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$segmentGraphNodeHash();

  @$internal
  @override
  $StreamProviderElement<Map<SegmentId, GraphNode<Segment>>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<Map<SegmentId, GraphNode<Segment>>> create(Ref ref) {
    return segmentGraphNode(ref);
  }
}

String _$segmentGraphNodeHash() => r'be81fb8cf6acd65d215b6aeb1cd8ffa1c88ec26e';
