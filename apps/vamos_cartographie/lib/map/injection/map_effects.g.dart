// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_effects.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MapEffectsNotifier)
final mapEffectsProvider = MapEffectsNotifierFamily._();

final class MapEffectsNotifierProvider
    extends $NotifierProvider<MapEffectsNotifier, void> {
  MapEffectsNotifierProvider._({
    required MapEffectsNotifierFamily super.from,
    required TripId super.argument,
  }) : super(
         retry: null,
         name: r'mapEffectsProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$mapEffectsNotifierHash();

  @override
  String toString() {
    return r'mapEffectsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  MapEffectsNotifier create() => MapEffectsNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is MapEffectsNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$mapEffectsNotifierHash() =>
    r'3d881f2d6843fbb1d6283d8865e23afe8932a2c9';

final class MapEffectsNotifierFamily extends $Family
    with $ClassFamilyOverride<MapEffectsNotifier, void, void, void, TripId> {
  MapEffectsNotifierFamily._()
    : super(
        retry: null,
        name: r'mapEffectsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  MapEffectsNotifierProvider call(TripId tripId) =>
      MapEffectsNotifierProvider._(argument: tripId, from: this);

  @override
  String toString() => r'mapEffectsProvider';
}

abstract class _$MapEffectsNotifier extends $Notifier<void> {
  late final _$args = ref.$arg as TripId;
  TripId get tripId => _$args;

  void build(TripId tripId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<void, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<void, void>,
              void,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
