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
    required Id<Trip> super.argument,
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
    final argument = this.argument as Id<Trip>;
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

String _$graphStoreHash() => r'e5f04982aea5561645a4ce23d3f099e82b081c82';

final class GraphStoreFamily extends $Family
    with $FunctionalFamilyOverride<GraphStore, Id<Trip>> {
  GraphStoreFamily._()
    : super(
        retry: null,
        name: r'graphStoreProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GraphStoreProvider call(Id<Trip> tripId) =>
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
    required (GraphStore, Id<Trip>) super.argument,
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
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument = this.argument as (GraphStore, Id<Trip>);
    return graphLoader(ref, argument.$1, argument.$2);
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

String _$graphLoaderHash() => r'b6d91c54d8f26c14d720b458a3f8e9b3006cbb12';

final class GraphLoaderFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<void>, (GraphStore, Id<Trip>)> {
  GraphLoaderFamily._()
    : super(
        retry: null,
        name: r'graphLoaderProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GraphLoaderProvider call(GraphStore graph, Id<Trip> tripId) =>
      GraphLoaderProvider._(argument: (graph, tripId), from: this);

  @override
  String toString() => r'graphLoaderProvider';
}

@ProviderFor(tripGraph)
final tripGraphProvider = TripGraphFamily._();

final class TripGraphProvider
    extends
        $FunctionalProvider<
          AsyncValue<GraphStore>,
          GraphStore,
          FutureOr<GraphStore>
        >
    with $FutureModifier<GraphStore>, $FutureProvider<GraphStore> {
  TripGraphProvider._({
    required TripGraphFamily super.from,
    required Id<Trip> super.argument,
  }) : super(
         retry: null,
         name: r'tripGraphProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$tripGraphHash();

  @override
  String toString() {
    return r'tripGraphProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<GraphStore> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<GraphStore> create(Ref ref) {
    final argument = this.argument as Id<Trip>;
    return tripGraph(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is TripGraphProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$tripGraphHash() => r'0b11d76189fe3af7b5a15c08dcc115e95a1d9684';

final class TripGraphFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<GraphStore>, Id<Trip>> {
  TripGraphFamily._()
    : super(
        retry: null,
        name: r'tripGraphProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  TripGraphProvider call(Id<Trip> tripId) =>
      TripGraphProvider._(argument: tripId, from: this);

  @override
  String toString() => r'tripGraphProvider';
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
