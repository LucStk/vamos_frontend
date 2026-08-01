// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_state_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MapStateNotifier)
final mapStateProvider = MapStateNotifierFamily._();

final class MapStateNotifierProvider
    extends $NotifierProvider<MapStateNotifier, MapState> {
  MapStateNotifierProvider._({
    required MapStateNotifierFamily super.from,
    required TripId super.argument,
  }) : super(
         retry: null,
         name: r'mapStateProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$mapStateNotifierHash();

  @override
  String toString() {
    return r'mapStateProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  MapStateNotifier create() => MapStateNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MapState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MapState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is MapStateNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$mapStateNotifierHash() => r'e30a831201376d42c29723b3c1af882f9aa6c2ac';

final class MapStateNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          MapStateNotifier,
          MapState,
          MapState,
          MapState,
          TripId
        > {
  MapStateNotifierFamily._()
    : super(
        retry: null,
        name: r'mapStateProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  MapStateNotifierProvider call(TripId tripId) =>
      MapStateNotifierProvider._(argument: tripId, from: this);

  @override
  String toString() => r'mapStateProvider';
}

abstract class _$MapStateNotifier extends $Notifier<MapState> {
  late final _$args = ref.$arg as TripId;
  TripId get tripId => _$args;

  MapState build(TripId tripId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<MapState, MapState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<MapState, MapState>,
              MapState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
