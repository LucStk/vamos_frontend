// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'graph_store.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(topologyRemoteDatasource)
final topologyRemoteDatasourceProvider = TopologyRemoteDatasourceProvider._();

final class TopologyRemoteDatasourceProvider
    extends
        $FunctionalProvider<
          TopologyRemoteDatasource,
          TopologyRemoteDatasource,
          TopologyRemoteDatasource
        >
    with $Provider<TopologyRemoteDatasource> {
  TopologyRemoteDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'topologyRemoteDatasourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$topologyRemoteDatasourceHash();

  @$internal
  @override
  $ProviderElement<TopologyRemoteDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TopologyRemoteDatasource create(Ref ref) {
    return topologyRemoteDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TopologyRemoteDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TopologyRemoteDatasource>(value),
    );
  }
}

String _$topologyRemoteDatasourceHash() =>
    r'2bdcf38911778d96e57ca5036cdfdce9a49cce3c';

@ProviderFor(topologyRepository)
final topologyRepositoryProvider = TopologyRepositoryProvider._();

final class TopologyRepositoryProvider
    extends
        $FunctionalProvider<
          TopologyRepository,
          TopologyRepository,
          TopologyRepository
        >
    with $Provider<TopologyRepository> {
  TopologyRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'topologyRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$topologyRepositoryHash();

  @$internal
  @override
  $ProviderElement<TopologyRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TopologyRepository create(Ref ref) {
    return topologyRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TopologyRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TopologyRepository>(value),
    );
  }
}

String _$topologyRepositoryHash() =>
    r'ce459e341adf92a08b78ff18080239737e638be0';

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
        isAutoDispose: false,
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

String _$rawGraphStoreHash() => r'13118b4dbe9c2d62bafeefce044e92acb2f199cd';

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
        isAutoDispose: false,
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
    r'228206a2a1fff4100f6c1bed3bf1ef8d809ba273';
