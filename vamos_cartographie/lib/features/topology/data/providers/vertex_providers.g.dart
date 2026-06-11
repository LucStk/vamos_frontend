// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vertex_providers.dart';

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

String _$vertexRepositoryHash() => r'ec39ce9d28f07d399f6e0d51cee0a9916831ceae';
