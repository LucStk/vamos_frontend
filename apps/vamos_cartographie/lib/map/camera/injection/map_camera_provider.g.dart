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

@ProviderFor(mapCameraSnapshot)
final mapCameraSnapshotProvider = MapCameraSnapshotProvider._();

final class MapCameraSnapshotProvider
    extends $FunctionalProvider<CameraSnapshot, CameraSnapshot, CameraSnapshot>
    with $Provider<CameraSnapshot> {
  MapCameraSnapshotProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mapCameraSnapshotProvider',
        isAutoDispose: false,
        dependencies: <ProviderOrFamily>[mapCameraProvider],
        $allTransitiveDependencies: <ProviderOrFamily>[
          MapCameraSnapshotProvider.$allTransitiveDependencies0,
        ],
      );

  static final $allTransitiveDependencies0 = mapCameraProvider;

  @override
  String debugGetCreateSourceHash() => _$mapCameraSnapshotHash();

  @$internal
  @override
  $ProviderElement<CameraSnapshot> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  CameraSnapshot create(Ref ref) {
    return mapCameraSnapshot(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CameraSnapshot value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CameraSnapshot>(value),
    );
  }
}

String _$mapCameraSnapshotHash() => r'010b56a95562a8ed1ce2a8407d31bb365c107e8f';
