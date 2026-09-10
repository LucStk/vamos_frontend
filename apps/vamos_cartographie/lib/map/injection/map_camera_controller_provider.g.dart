// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_camera_controller_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(mapCameraController)
final mapCameraControllerProvider = MapCameraControllerProvider._();

final class MapCameraControllerProvider
    extends
        $FunctionalProvider<
          MapCameraController,
          MapCameraController,
          MapCameraController
        >
    with $Provider<MapCameraController> {
  MapCameraControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mapCameraControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mapCameraControllerHash();

  @$internal
  @override
  $ProviderElement<MapCameraController> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  MapCameraController create(Ref ref) {
    return mapCameraController(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MapCameraController value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MapCameraController>(value),
    );
  }
}

String _$mapCameraControllerHash() =>
    r'568894eb2e8605bed07647a7664162ed553302af';
