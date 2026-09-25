// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_camera_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MapCameraChanges)
final mapCameraChangesProvider = MapCameraChangesProvider._();

final class MapCameraChangesProvider
    extends $NotifierProvider<MapCameraChanges, int> {
  MapCameraChangesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mapCameraChangesProvider',
        isAutoDispose: true,
        dependencies: <ProviderOrFamily>[mapContextProvider],
        $allTransitiveDependencies: <ProviderOrFamily>[
          MapCameraChangesProvider.$allTransitiveDependencies0,
        ],
      );

  static final $allTransitiveDependencies0 = mapContextProvider;

  @override
  String debugGetCreateSourceHash() => _$mapCameraChangesHash();

  @$internal
  @override
  MapCameraChanges create() => MapCameraChanges();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$mapCameraChangesHash() => r'2af8a639bfdba67194444da32ec5cf8cc71c605b';

abstract class _$MapCameraChanges extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

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
        dependencies: <ProviderOrFamily>[
          mapCameraChangesProvider,
          mapContextProvider,
        ],
        $allTransitiveDependencies: <ProviderOrFamily>[
          MapCameraSnapshotProvider.$allTransitiveDependencies0,
          MapCameraSnapshotProvider.$allTransitiveDependencies1,
        ],
      );

  static final $allTransitiveDependencies0 = mapCameraChangesProvider;
  static final $allTransitiveDependencies1 =
      MapCameraChangesProvider.$allTransitiveDependencies0;

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

String _$mapCameraSnapshotHash() => r'aeadb7c65b4a5f2c3ba3922d2eef5eaa932ba6e6';
