// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topology_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(topologyHandler)
final topologyHandlerProvider = TopologyHandlerFamily._();

final class TopologyHandlerProvider
    extends
        $FunctionalProvider<TopologyHandler, TopologyHandler, TopologyHandler>
    with $Provider<TopologyHandler> {
  TopologyHandlerProvider._({
    required TopologyHandlerFamily super.from,
    required TripId super.argument,
  }) : super(
         retry: null,
         name: r'topologyHandlerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$topologyHandlerHash();

  @override
  String toString() {
    return r'topologyHandlerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<TopologyHandler> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TopologyHandler create(Ref ref) {
    final argument = this.argument as TripId;
    return topologyHandler(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TopologyHandler value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TopologyHandler>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is TopologyHandlerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$topologyHandlerHash() => r'2341fcd7a0626543d3e7e34ae2efa4559c8bc059';

final class TopologyHandlerFamily extends $Family
    with $FunctionalFamilyOverride<TopologyHandler, TripId> {
  TopologyHandlerFamily._()
    : super(
        retry: null,
        name: r'topologyHandlerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  TopologyHandlerProvider call(TripId tripId) =>
      TopologyHandlerProvider._(argument: tripId, from: this);

  @override
  String toString() => r'topologyHandlerProvider';
}
