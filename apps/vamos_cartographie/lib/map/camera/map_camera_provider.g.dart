// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_camera_provider.dart';

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
        dependencies: null,
        $allTransitiveDependencies: null,
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

String _$mapCameraHash() => r'cad9e879cf81b08519f5dd33b0b2a107aaa442df';

/// La caméra une fois la carte montée, sinon `null`.
/// Pont entre `camera.ready` (ValueNotifier) et Riverpod.

@ProviderFor(readyCamera)
final readyCameraProvider = ReadyCameraProvider._();

/// La caméra une fois la carte montée, sinon `null`.
/// Pont entre `camera.ready` (ValueNotifier) et Riverpod.

final class ReadyCameraProvider
    extends
        $FunctionalProvider<
          FlutterMapCamera?,
          FlutterMapCamera?,
          FlutterMapCamera?
        >
    with $Provider<FlutterMapCamera?> {
  /// La caméra une fois la carte montée, sinon `null`.
  /// Pont entre `camera.ready` (ValueNotifier) et Riverpod.
  ReadyCameraProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'readyCameraProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$readyCameraHash();

  @$internal
  @override
  $ProviderElement<FlutterMapCamera?> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  FlutterMapCamera? create(Ref ref) {
    return readyCamera(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FlutterMapCamera? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FlutterMapCamera?>(value),
    );
  }
}

String _$readyCameraHash() => r'5fb5c00e1209a684daf6124706268e8c1ee24885';
