// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vertex_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(vertexRemoteDatasource)
final vertexRemoteDatasourceProvider = VertexRemoteDatasourceProvider._();

final class VertexRemoteDatasourceProvider
    extends
        $FunctionalProvider<
          VertexRemoteDatasource,
          VertexRemoteDatasource,
          VertexRemoteDatasource
        >
    with $Provider<VertexRemoteDatasource> {
  VertexRemoteDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'vertexRemoteDatasourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$vertexRemoteDatasourceHash();

  @$internal
  @override
  $ProviderElement<VertexRemoteDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  VertexRemoteDatasource create(Ref ref) {
    return vertexRemoteDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(VertexRemoteDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<VertexRemoteDatasource>(value),
    );
  }
}

String _$vertexRemoteDatasourceHash() =>
    r'06a82eb656f73e16ff72176824f7c2cb28c87374';

@ProviderFor(vertexRepository)
final vertexRepositoryProvider = VertexRepositoryProvider._();

final class VertexRepositoryProvider
    extends
        $FunctionalProvider<
          VertexRepository,
          VertexRepository,
          VertexRepository
        >
    with $Provider<VertexRepository> {
  VertexRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'vertexRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$vertexRepositoryHash();

  @$internal
  @override
  $ProviderElement<VertexRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  VertexRepository create(Ref ref) {
    return vertexRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(VertexRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<VertexRepository>(value),
    );
  }
}

String _$vertexRepositoryHash() => r'66dd891c01a4ecc21944f43123c221426aaebe65';

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

String _$vertexStoreHash() => r'd6bb6691483d7c6e085a2bd285f37c822b2b39fc';

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
