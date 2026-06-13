// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'graph_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(graphStore)
final graphStoreProvider = GraphStoreFamily._();

final class GraphStoreProvider
    extends $FunctionalProvider<GraphStore, GraphStore, GraphStore>
    with $Provider<GraphStore> {
  GraphStoreProvider._({
    required GraphStoreFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'graphStoreProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$graphStoreHash();

  @override
  String toString() {
    return r'graphStoreProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<GraphStore> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GraphStore create(Ref ref) {
    final argument = this.argument as int;
    return graphStore(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GraphStore value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GraphStore>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is GraphStoreProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$graphStoreHash() => r'cd158b57afd3582f4fdc42f00ceb27e36299e682';

final class GraphStoreFamily extends $Family
    with $FunctionalFamilyOverride<GraphStore, int> {
  GraphStoreFamily._()
    : super(
        retry: null,
        name: r'graphStoreProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GraphStoreProvider call(int tripId) =>
      GraphStoreProvider._(argument: tripId, from: this);

  @override
  String toString() => r'graphStoreProvider';
}

@ProviderFor(graphLoader)
final graphLoaderProvider = GraphLoaderFamily._();

final class GraphLoaderProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  GraphLoaderProvider._({
    required GraphLoaderFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'graphLoaderProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$graphLoaderHash();

  @override
  String toString() {
    return r'graphLoaderProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument = this.argument as int;
    return graphLoader(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is GraphLoaderProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$graphLoaderHash() => r'5651985a9512379d546a52c0c5769a2214cb1fa8';

final class GraphLoaderFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<void>, int> {
  GraphLoaderFamily._()
    : super(
        retry: null,
        name: r'graphLoaderProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GraphLoaderProvider call(int tripId) =>
      GraphLoaderProvider._(argument: tripId, from: this);

  @override
  String toString() => r'graphLoaderProvider';
}

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
