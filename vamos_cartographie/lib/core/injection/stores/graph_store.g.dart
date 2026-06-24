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

String _$rawGraphStoreHash() => r'36d466b744ecfa7a6e5a4f88f703c5e5b812b01d';

@ProviderFor(rawGraphPatchStore)
final rawGraphPatchStoreProvider = RawGraphPatchStoreProvider._();

final class RawGraphPatchStoreProvider
    extends
        $FunctionalProvider<GraphPatchStore, GraphPatchStore, GraphPatchStore>
    with $Provider<GraphPatchStore> {
  RawGraphPatchStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'rawGraphPatchStoreProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$rawGraphPatchStoreHash();

  @$internal
  @override
  $ProviderElement<GraphPatchStore> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GraphPatchStore create(Ref ref) {
    return rawGraphPatchStore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GraphPatchStore value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GraphPatchStore>(value),
    );
  }
}

String _$rawGraphPatchStoreHash() =>
    r'58895d5f3f8a29c095ff0fc5ac3f7393266e9b26';

@ProviderFor(vertexStore)
final vertexStoreProvider = VertexStoreProvider._();

final class VertexStoreProvider
    extends
        $FunctionalProvider<
          ObservableCollectionStore<Vertex>,
          ObservableCollectionStore<Vertex>,
          ObservableCollectionStore<Vertex>
        >
    with $Provider<ObservableCollectionStore<Vertex>> {
  VertexStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'vertexStoreProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$vertexStoreHash();

  @$internal
  @override
  $ProviderElement<ObservableCollectionStore<Vertex>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ObservableCollectionStore<Vertex> create(Ref ref) {
    return vertexStore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ObservableCollectionStore<Vertex> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ObservableCollectionStore<Vertex>>(
        value,
      ),
    );
  }
}

String _$vertexStoreHash() => r'4fa740f67a2c82102da5ecd9433e6cd261aef786';

@ProviderFor(vertexPatchStore)
final vertexPatchStoreProvider = VertexPatchStoreProvider._();

final class VertexPatchStoreProvider
    extends
        $FunctionalProvider<
          ObservableCollectionStore<VertexPatch>,
          ObservableCollectionStore<VertexPatch>,
          ObservableCollectionStore<VertexPatch>
        >
    with $Provider<ObservableCollectionStore<VertexPatch>> {
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
  $ProviderElement<ObservableCollectionStore<VertexPatch>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ObservableCollectionStore<VertexPatch> create(Ref ref) {
    return vertexPatchStore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ObservableCollectionStore<VertexPatch> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<ObservableCollectionStore<VertexPatch>>(value),
    );
  }
}

String _$vertexPatchStoreHash() => r'0834a6bb89cf69b2c29c933bac23d129dbb692a8';

@ProviderFor(segmentStore)
final segmentStoreProvider = SegmentStoreProvider._();

final class SegmentStoreProvider
    extends
        $FunctionalProvider<
          ObservableCollectionStore<Segment>,
          ObservableCollectionStore<Segment>,
          ObservableCollectionStore<Segment>
        >
    with $Provider<ObservableCollectionStore<Segment>> {
  SegmentStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'segmentStoreProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$segmentStoreHash();

  @$internal
  @override
  $ProviderElement<ObservableCollectionStore<Segment>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ObservableCollectionStore<Segment> create(Ref ref) {
    return segmentStore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ObservableCollectionStore<Segment> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ObservableCollectionStore<Segment>>(
        value,
      ),
    );
  }
}

String _$segmentStoreHash() => r'221a89707870b0085be18c7362fab9d01f91753b';

@ProviderFor(segmentPatchStore)
final segmentPatchStoreProvider = SegmentPatchStoreProvider._();

final class SegmentPatchStoreProvider
    extends
        $FunctionalProvider<
          ObservableCollectionStore<SegmentPatch>,
          ObservableCollectionStore<SegmentPatch>,
          ObservableCollectionStore<SegmentPatch>
        >
    with $Provider<ObservableCollectionStore<SegmentPatch>> {
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
  $ProviderElement<ObservableCollectionStore<SegmentPatch>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ObservableCollectionStore<SegmentPatch> create(Ref ref) {
    return segmentPatchStore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ObservableCollectionStore<SegmentPatch> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<ObservableCollectionStore<SegmentPatch>>(value),
    );
  }
}

String _$segmentPatchStoreHash() => r'cd237c1c03eb4640168fe15a3adae40919702705';
