// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'graph_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TripGraph)
final tripGraphProvider = TripGraphFamily._();

final class TripGraphProvider
    extends $AsyncNotifierProvider<TripGraph, GraphStore> {
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
  TripGraph create() => TripGraph();

  @override
  bool operator ==(Object other) {
    return other is TripGraphProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$tripGraphHash() => r'bfad710d88f27ffebabf3aab8abb7036a6c9a83d';

final class TripGraphFamily extends $Family
    with
        $ClassFamilyOverride<
          TripGraph,
          AsyncValue<GraphStore>,
          GraphStore,
          FutureOr<GraphStore>,
          Id<Trip>
        > {
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

abstract class _$TripGraph extends $AsyncNotifier<GraphStore> {
  late final _$args = ref.$arg as Id<Trip>;
  Id<Trip> get tripId => _$args;

  FutureOr<GraphStore> build(Id<Trip> tripId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<GraphStore>, GraphStore>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<GraphStore>, GraphStore>,
              AsyncValue<GraphStore>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
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
