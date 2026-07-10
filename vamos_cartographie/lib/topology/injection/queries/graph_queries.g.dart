// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'graph_queries.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(topologyQueryHandler)
final topologyQueryHandlerProvider = TopologyQueryHandlerProvider._();

final class TopologyQueryHandlerProvider
    extends
        $FunctionalProvider<
          TopologyQueryHandler,
          TopologyQueryHandler,
          TopologyQueryHandler
        >
    with $Provider<TopologyQueryHandler> {
  TopologyQueryHandlerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'topologyQueryHandlerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$topologyQueryHandlerHash();

  @$internal
  @override
  $ProviderElement<TopologyQueryHandler> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TopologyQueryHandler create(Ref ref) {
    return topologyQueryHandler(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TopologyQueryHandler value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TopologyQueryHandler>(value),
    );
  }
}

String _$topologyQueryHandlerHash() =>
    r'4d3c50ea2b04ebb95fb8cb6c2fbbb5e8269f87e2';

@ProviderFor(loadTopology)
final loadTopologyProvider = LoadTopologyFamily._();

final class LoadTopologyProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  LoadTopologyProvider._({
    required LoadTopologyFamily super.from,
    required TripId super.argument,
  }) : super(
         retry: null,
         name: r'loadTopologyProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$loadTopologyHash();

  @override
  String toString() {
    return r'loadTopologyProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument = this.argument as TripId;
    return loadTopology(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is LoadTopologyProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$loadTopologyHash() => r'0cc804c4f1ae48150e89f12a4801ce129c0a5fae';

final class LoadTopologyFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<void>, TripId> {
  LoadTopologyFamily._()
    : super(
        retry: null,
        name: r'loadTopologyProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  LoadTopologyProvider call(TripId tripId) =>
      LoadTopologyProvider._(argument: tripId, from: this);

  @override
  String toString() => r'loadTopologyProvider';
}
