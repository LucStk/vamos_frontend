// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_context_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(mapCamera)
final mapCameraProvider = MapCameraProvider._();

final class MapCameraProvider
    extends
        $FunctionalProvider<
          FlutterMapCamera,
          FlutterMapCamera,
          FlutterMapCamera
        >
    with $Provider<FlutterMapCamera> {
  MapCameraProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mapCameraProvider',
        isAutoDispose: false,
        dependencies: <ProviderOrFamily>[],
        $allTransitiveDependencies: <ProviderOrFamily>[],
      );

  @override
  String debugGetCreateSourceHash() => _$mapCameraHash();

  @$internal
  @override
  $ProviderElement<FlutterMapCamera> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  FlutterMapCamera create(Ref ref) {
    return mapCamera(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FlutterMapCamera value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FlutterMapCamera>(value),
    );
  }
}

String _$mapCameraHash() => r'813cba9e11141ec0f8976aededb1019f982276b6';

@ProviderFor(mapController)
final mapControllerProvider = MapControllerProvider._();

final class MapControllerProvider
    extends
        $FunctionalProvider<
          BaseController<BaseMode<BaseMode<dynamic>>>,
          BaseController<BaseMode<BaseMode<dynamic>>>,
          BaseController<BaseMode<BaseMode<dynamic>>>
        >
    with $Provider<BaseController<BaseMode<BaseMode<dynamic>>>> {
  MapControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mapControllerProvider',
        isAutoDispose: false,
        dependencies: <ProviderOrFamily>[],
        $allTransitiveDependencies: <ProviderOrFamily>[],
      );

  @override
  String debugGetCreateSourceHash() => _$mapControllerHash();

  @$internal
  @override
  $ProviderElement<BaseController<BaseMode<BaseMode<dynamic>>>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  BaseController<BaseMode<BaseMode<dynamic>>> create(Ref ref) {
    return mapController(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(
    BaseController<BaseMode<BaseMode<dynamic>>> value,
  ) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<BaseController<BaseMode<BaseMode<dynamic>>>>(
            value,
          ),
    );
  }
}

String _$mapControllerHash() => r'89220365b6d2a488d934692d160062fd6f7ac916';

@ProviderFor(mapScene)
final mapSceneProvider = MapSceneProvider._();

final class MapSceneProvider
    extends $FunctionalProvider<MapScene, MapScene, MapScene>
    with $Provider<MapScene> {
  MapSceneProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mapSceneProvider',
        isAutoDispose: false,
        dependencies: <ProviderOrFamily>[],
        $allTransitiveDependencies: <ProviderOrFamily>[],
      );

  @override
  String debugGetCreateSourceHash() => _$mapSceneHash();

  @$internal
  @override
  $ProviderElement<MapScene> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MapScene create(Ref ref) {
    return mapScene(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MapScene value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MapScene>(value),
    );
  }
}

String _$mapSceneHash() => r'95a2b6036c0089d85442ea4ff7c781dfb8cbd21d';
