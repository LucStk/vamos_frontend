// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_output_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MapOutputNotifier)
final mapOutputProvider = MapOutputNotifierFamily._();

final class MapOutputNotifierProvider
    extends $NotifierProvider<MapOutputNotifier, MapOutputQueue> {
  MapOutputNotifierProvider._({
    required MapOutputNotifierFamily super.from,
    required TripId super.argument,
  }) : super(
         retry: null,
         name: r'mapOutputProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$mapOutputNotifierHash();

  @override
  String toString() {
    return r'mapOutputProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  MapOutputNotifier create() => MapOutputNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MapOutputQueue value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MapOutputQueue>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is MapOutputNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$mapOutputNotifierHash() => r'020af696fd4e5081964d9f26cb86209d7b4df6f7';

final class MapOutputNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          MapOutputNotifier,
          MapOutputQueue,
          MapOutputQueue,
          MapOutputQueue,
          TripId
        > {
  MapOutputNotifierFamily._()
    : super(
        retry: null,
        name: r'mapOutputProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  MapOutputNotifierProvider call(TripId tripId) =>
      MapOutputNotifierProvider._(argument: tripId, from: this);

  @override
  String toString() => r'mapOutputProvider';
}

abstract class _$MapOutputNotifier extends $Notifier<MapOutputQueue> {
  late final _$args = ref.$arg as TripId;
  TripId get tripId => _$args;

  MapOutputQueue build(TripId tripId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<MapOutputQueue, MapOutputQueue>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<MapOutputQueue, MapOutputQueue>,
              MapOutputQueue,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
