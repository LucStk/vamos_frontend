// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_hit_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(mapHitEngine)
final mapHitEngineProvider = MapHitEngineProvider._();

final class MapHitEngineProvider
    extends $FunctionalProvider<MapHitEngine, MapHitEngine, MapHitEngine>
    with $Provider<MapHitEngine> {
  MapHitEngineProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mapHitEngineProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mapHitEngineHash();

  @$internal
  @override
  $ProviderElement<MapHitEngine> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MapHitEngine create(Ref ref) {
    return mapHitEngine(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MapHitEngine value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MapHitEngine>(value),
    );
  }
}

String _$mapHitEngineHash() => r'b441627fa3cebb6549152569f5fc41a1a44e3b03';
