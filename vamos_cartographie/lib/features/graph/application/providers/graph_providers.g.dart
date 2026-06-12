// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'graph_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(graphStore)
final graphStoreProvider = GraphStoreProvider._();

final class GraphStoreProvider
    extends $FunctionalProvider<GraphStore, GraphStore, GraphStore>
    with $Provider<GraphStore> {
  GraphStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'graphStoreProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$graphStoreHash();

  @$internal
  @override
  $ProviderElement<GraphStore> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GraphStore create(Ref ref) {
    return graphStore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GraphStore value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GraphStore>(value),
    );
  }
}

String _$graphStoreHash() => r'61e0dbddc65de98a5d6e2b7dee4cde3257bcfdff';

@ProviderFor(optimisticExecutor)
final optimisticExecutorProvider = OptimisticExecutorProvider._();

final class OptimisticExecutorProvider
    extends
        $FunctionalProvider<
          OptimisticExecutor,
          OptimisticExecutor,
          OptimisticExecutor
        >
    with $Provider<OptimisticExecutor> {
  OptimisticExecutorProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'optimisticExecutorProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$optimisticExecutorHash();

  @$internal
  @override
  $ProviderElement<OptimisticExecutor> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  OptimisticExecutor create(Ref ref) {
    return optimisticExecutor(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OptimisticExecutor value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<OptimisticExecutor>(value),
    );
  }
}

String _$optimisticExecutorHash() =>
    r'7d19144c38633229923f1a9260e74f64f3a17be6';
