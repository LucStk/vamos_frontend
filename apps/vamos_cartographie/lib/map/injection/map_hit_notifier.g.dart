// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_hit_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(mapController)
final mapControllerProvider = MapControllerProvider._();

final class MapControllerProvider
    extends $FunctionalProvider<MapController, MapController, MapController>
    with $Provider<MapController> {
  MapControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mapControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mapControllerHash();

  @$internal
  @override
  $ProviderElement<MapController> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MapController create(Ref ref) {
    return mapController(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MapController value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MapController>(value),
    );
  }
}

String _$mapControllerHash() => r'01091ae14b2433a24e4f7bb7fa96482892ee07d1';

@ProviderFor(hitLayerNotifier)
final hitLayerProvider = HitLayerNotifierProvider._();

final class HitLayerNotifierProvider
    extends
        $FunctionalProvider<
          ValueNotifier<LayerHitResult<MapHit>?>,
          ValueNotifier<LayerHitResult<MapHit>?>,
          ValueNotifier<LayerHitResult<MapHit>?>
        >
    with $Provider<ValueNotifier<LayerHitResult<MapHit>?>> {
  HitLayerNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'hitLayerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$hitLayerNotifierHash();

  @$internal
  @override
  $ProviderElement<ValueNotifier<LayerHitResult<MapHit>?>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ValueNotifier<LayerHitResult<MapHit>?> create(Ref ref) {
    return hitLayerNotifier(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ValueNotifier<LayerHitResult<MapHit>?> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<ValueNotifier<LayerHitResult<MapHit>?>>(value),
    );
  }
}

String _$hitLayerNotifierHash() => r'1dced9bd03fa8411614f0b9ef517e7ab90cb280b';

@ProviderFor(shouldPanMap)
final shouldPanMapProvider = ShouldPanMapProvider._();

final class ShouldPanMapProvider
    extends
        $FunctionalProvider<
          ValueNotifier<bool>,
          ValueNotifier<bool>,
          ValueNotifier<bool>
        >
    with $Provider<ValueNotifier<bool>> {
  ShouldPanMapProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'shouldPanMapProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$shouldPanMapHash();

  @$internal
  @override
  $ProviderElement<ValueNotifier<bool>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ValueNotifier<bool> create(Ref ref) {
    return shouldPanMap(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ValueNotifier<bool> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ValueNotifier<bool>>(value),
    );
  }
}

String _$shouldPanMapHash() => r'136039611a72a45e4e52c10dcfa0f3f7655379f2';
