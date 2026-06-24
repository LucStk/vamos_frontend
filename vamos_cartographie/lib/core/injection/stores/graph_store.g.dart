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

@ProviderFor(vertexGraphStore)
final vertexGraphStoreProvider = VertexGraphStoreProvider._();

final class VertexGraphStoreProvider
    extends
        $FunctionalProvider<
          ObservableCollectionStore<HasId>,
          ObservableCollectionStore<HasId>,
          ObservableCollectionStore<HasId>
        >
    with $Provider<ObservableCollectionStore<HasId>> {
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
  $ProviderElement<ObservableCollectionStore<HasId>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ObservableCollectionStore<HasId> create(Ref ref) {
    return vertexGraphStore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ObservableCollectionStore<HasId> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ObservableCollectionStore<HasId>>(
        value,
      ),
    );
  }
}

String _$vertexGraphStoreHash() => r'd84d839fcdd673d9f5593ccf6b351b4ec4e4e02b';

@ProviderFor(vertexGraphPatchStore)
final vertexGraphPatchStoreProvider = VertexGraphPatchStoreProvider._();

final class VertexGraphPatchStoreProvider
    extends
        $FunctionalProvider<
          ObservableCollectionStore<HasId>,
          ObservableCollectionStore<HasId>,
          ObservableCollectionStore<HasId>
        >
    with $Provider<ObservableCollectionStore<HasId>> {
  VertexGraphPatchStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'vertexGraphPatchStoreProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$vertexGraphPatchStoreHash();

  @$internal
  @override
  $ProviderElement<ObservableCollectionStore<HasId>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ObservableCollectionStore<HasId> create(Ref ref) {
    return vertexGraphPatchStore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ObservableCollectionStore<HasId> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ObservableCollectionStore<HasId>>(
        value,
      ),
    );
  }
}

String _$vertexGraphPatchStoreHash() =>
    r'b279f62dc5b6fb4e8450fbec0014dc9aa2812fbf';

@ProviderFor(segmentGraphStore)
final segmentGraphStoreProvider = SegmentGraphStoreProvider._();

final class SegmentGraphStoreProvider
    extends
        $FunctionalProvider<
          ObservableCollectionStore<HasId>,
          ObservableCollectionStore<HasId>,
          ObservableCollectionStore<HasId>
        >
    with $Provider<ObservableCollectionStore<HasId>> {
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
  $ProviderElement<ObservableCollectionStore<HasId>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ObservableCollectionStore<HasId> create(Ref ref) {
    return segmentGraphStore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ObservableCollectionStore<HasId> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ObservableCollectionStore<HasId>>(
        value,
      ),
    );
  }
}

String _$segmentGraphStoreHash() => r'98c6a7d1dd61b6777e8bbad10275dd886b760f44';

@ProviderFor(segmentGraphPatchStore)
final segmentGraphPatchStoreProvider = SegmentGraphPatchStoreProvider._();

final class SegmentGraphPatchStoreProvider
    extends
        $FunctionalProvider<
          ObservableCollectionStore<HasId>,
          ObservableCollectionStore<HasId>,
          ObservableCollectionStore<HasId>
        >
    with $Provider<ObservableCollectionStore<HasId>> {
  SegmentGraphPatchStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'segmentGraphPatchStoreProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$segmentGraphPatchStoreHash();

  @$internal
  @override
  $ProviderElement<ObservableCollectionStore<HasId>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ObservableCollectionStore<HasId> create(Ref ref) {
    return segmentGraphPatchStore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ObservableCollectionStore<HasId> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ObservableCollectionStore<HasId>>(
        value,
      ),
    );
  }
}

String _$segmentGraphPatchStoreHash() =>
    r'e0880140d5b953cf0a918dc7de95419cf246c7d2';
