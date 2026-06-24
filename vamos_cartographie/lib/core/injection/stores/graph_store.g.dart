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

@ProviderFor(rawPatchStore)
final rawPatchStoreProvider = RawPatchStoreProvider._();

final class RawPatchStoreProvider
    extends
        $FunctionalProvider<GraphPatchStore, GraphPatchStore, GraphPatchStore>
    with $Provider<GraphPatchStore> {
  RawPatchStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'rawPatchStoreProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$rawPatchStoreHash();

  @$internal
  @override
  $ProviderElement<GraphPatchStore> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GraphPatchStore create(Ref ref) {
    return rawPatchStore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GraphPatchStore value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GraphPatchStore>(value),
    );
  }
}

String _$rawPatchStoreHash() => r'068037ceb303624e753ab6a0bef4d557793db542';

@ProviderFor(vertexGraphStore)
final vertexGraphStoreProvider = VertexGraphStoreProvider._();

final class VertexGraphStoreProvider
    extends
        $FunctionalProvider<
          AsyncValue<Map<VertexId, GraphNode<Vertex>>>,
          Map<VertexId, GraphNode<Vertex>>,
          Stream<Map<VertexId, GraphNode<Vertex>>>
        >
    with
        $FutureModifier<Map<VertexId, GraphNode<Vertex>>>,
        $StreamProvider<Map<VertexId, GraphNode<Vertex>>> {
  VertexGraphStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'vertexGraphStoreProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$vertexGraphStoreHash();

  @$internal
  @override
  $StreamProviderElement<Map<VertexId, GraphNode<Vertex>>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<Map<VertexId, GraphNode<Vertex>>> create(Ref ref) {
    return vertexGraphStore(ref);
  }
}

String _$vertexGraphStoreHash() => r'cfaeeb94af3961911e4bd4fcedf512ca019aed90';

@ProviderFor(segmentGraphStore)
final segmentGraphStoreProvider = SegmentGraphStoreProvider._();

final class SegmentGraphStoreProvider
    extends
        $FunctionalProvider<
          AsyncValue<Map<SegmentId, GraphNode<Segment>>>,
          Map<SegmentId, GraphNode<Segment>>,
          Stream<Map<SegmentId, GraphNode<Segment>>>
        >
    with
        $FutureModifier<Map<SegmentId, GraphNode<Segment>>>,
        $StreamProvider<Map<SegmentId, GraphNode<Segment>>> {
  SegmentGraphStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'segmentGraphStoreProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$segmentGraphStoreHash();

  @$internal
  @override
  $StreamProviderElement<Map<SegmentId, GraphNode<Segment>>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<Map<SegmentId, GraphNode<Segment>>> create(Ref ref) {
    return segmentGraphStore(ref);
  }
}

String _$segmentGraphStoreHash() => r'9d07d02cefec6a8749a3f3d30de59465c54de232';

@ProviderFor(segmentPatchStore)
final segmentPatchStoreProvider = SegmentPatchStoreProvider._();

final class SegmentPatchStoreProvider
    extends
        $FunctionalProvider<
          AsyncValue<Map<SegmentId, SegmentPatch>>,
          Map<SegmentId, SegmentPatch>,
          Stream<Map<SegmentId, SegmentPatch>>
        >
    with
        $FutureModifier<Map<SegmentId, SegmentPatch>>,
        $StreamProvider<Map<SegmentId, SegmentPatch>> {
  SegmentPatchStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'segmentPatchStoreProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$segmentPatchStoreHash();

  @$internal
  @override
  $StreamProviderElement<Map<SegmentId, SegmentPatch>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<Map<SegmentId, SegmentPatch>> create(Ref ref) {
    return segmentPatchStore(ref);
  }
}

String _$segmentPatchStoreHash() => r'50e24f259517800d5d537417c07ad0654ecd8ed8';

@ProviderFor(vertexPatchStore)
final vertexPatchStoreProvider = VertexPatchStoreProvider._();

final class VertexPatchStoreProvider
    extends
        $FunctionalProvider<
          AsyncValue<Map<VertexId, VertexPatch>>,
          Map<VertexId, VertexPatch>,
          Stream<Map<VertexId, VertexPatch>>
        >
    with
        $FutureModifier<Map<VertexId, VertexPatch>>,
        $StreamProvider<Map<VertexId, VertexPatch>> {
  VertexPatchStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'vertexPatchStoreProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$vertexPatchStoreHash();

  @$internal
  @override
  $StreamProviderElement<Map<VertexId, VertexPatch>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<Map<VertexId, VertexPatch>> create(Ref ref) {
    return vertexPatchStore(ref);
  }
}

String _$vertexPatchStoreHash() => r'9c0e527bad9171c50f89527c41353e42fbf6134c';
