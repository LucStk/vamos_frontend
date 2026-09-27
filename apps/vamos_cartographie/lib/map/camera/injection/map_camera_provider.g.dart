// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_camera_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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
        isAutoDispose: true,
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

String _$mapCameraSnapshotHash() => r'cf872b1d3c3512cabd12196d10405e60e0c1062c';
