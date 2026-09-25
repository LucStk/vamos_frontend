// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_camera_provider.dart';

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
        isAutoDispose: false,
        dependencies: <ProviderOrFamily>[],
        $allTransitiveDependencies: <ProviderOrFamily>[],
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

String _$mapControllerHash() => r'175eaad4ed4925a432171050c6c6d8dc71d5a595';

@ProviderFor(MapCameraHolder)
final mapCameraHolderProvider = MapCameraHolderProvider._();

final class MapCameraHolderProvider
    extends $NotifierProvider<MapCameraHolder, MapCameraController> {
  MapCameraHolderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mapCameraHolderProvider',
        isAutoDispose: false,
        dependencies: <ProviderOrFamily>[mapControllerProvider],
        $allTransitiveDependencies: <ProviderOrFamily>[
          MapCameraHolderProvider.$allTransitiveDependencies0,
        ],
      );

  static final $allTransitiveDependencies0 = mapControllerProvider;

  @override
  String debugGetCreateSourceHash() => _$mapCameraHolderHash();

  @$internal
  @override
  MapCameraHolder create() => MapCameraHolder();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MapCameraController value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MapCameraController>(value),
    );
  }
}

String _$mapCameraHolderHash() => r'a2c2769804bc57ee4651c5368c27ce3289da73de';

abstract class _$MapCameraHolder extends $Notifier<MapCameraController> {
  MapCameraController build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<MapCameraController, MapCameraController>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<MapCameraController, MapCameraController>,
              MapCameraController,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

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
        dependencies: <ProviderOrFamily>[mapControllerProvider],
        $allTransitiveDependencies: <ProviderOrFamily>[
          MapCameraChangesProvider.$allTransitiveDependencies0,
        ],
      );

  static final $allTransitiveDependencies0 = mapControllerProvider;

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

String _$mapCameraChangesHash() => r'30c7dee38d2fb973d1d2cad35c6e13b94f7d2179';

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
          mapCameraHolderProvider,
        ],
        $allTransitiveDependencies: <ProviderOrFamily>[
          MapCameraSnapshotProvider.$allTransitiveDependencies0,
          MapCameraSnapshotProvider.$allTransitiveDependencies1,
          MapCameraSnapshotProvider.$allTransitiveDependencies2,
        ],
      );

  static final $allTransitiveDependencies0 = mapCameraChangesProvider;
  static final $allTransitiveDependencies1 =
      MapCameraChangesProvider.$allTransitiveDependencies0;
  static final $allTransitiveDependencies2 = mapCameraHolderProvider;

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

String _$mapCameraSnapshotHash() => r'1db560606678d0a9d09ebb2155603c3f6e4ee8a5';
