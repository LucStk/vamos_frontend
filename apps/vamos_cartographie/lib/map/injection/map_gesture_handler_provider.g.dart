// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_gesture_handler_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(mapGestureHandler)
final mapGestureHandlerProvider = MapGestureHandlerProvider._();

final class MapGestureHandlerProvider
    extends
        $FunctionalProvider<
          MapGestureHandler,
          MapGestureHandler,
          MapGestureHandler
        >
    with $Provider<MapGestureHandler> {
  MapGestureHandlerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mapGestureHandlerProvider',
        isAutoDispose: false,
        dependencies: <ProviderOrFamily>[
          mapControllerProvider,
          mapSceneProvider,
          mapCameraProvider,
        ],
        $allTransitiveDependencies: <ProviderOrFamily>[
          MapGestureHandlerProvider.$allTransitiveDependencies0,
          MapGestureHandlerProvider.$allTransitiveDependencies1,
          MapGestureHandlerProvider.$allTransitiveDependencies2,
        ],
      );

  static final $allTransitiveDependencies0 = mapControllerProvider;
  static final $allTransitiveDependencies1 = mapSceneProvider;
  static final $allTransitiveDependencies2 = mapCameraProvider;

  @override
  String debugGetCreateSourceHash() => _$mapGestureHandlerHash();

  @$internal
  @override
  $ProviderElement<MapGestureHandler> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  MapGestureHandler create(Ref ref) {
    return mapGestureHandler(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MapGestureHandler value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MapGestureHandler>(value),
    );
  }
}

String _$mapGestureHandlerHash() => r'2b64d4bd4f49c2ccde4152f2424aaefc97041f12';
