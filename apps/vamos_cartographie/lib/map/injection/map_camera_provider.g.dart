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

String _$mapControllerHash() => r'57a5965305d052b2d10a7d48f30ad5154d5adb26';

@ProviderFor(mapCameraReader)
final mapCameraReaderProvider = MapCameraReaderProvider._();

final class MapCameraReaderProvider
    extends
        $FunctionalProvider<MapCameraReader, MapCameraReader, MapCameraReader>
    with $Provider<MapCameraReader> {
  MapCameraReaderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mapCameraReaderProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mapCameraReaderHash();

  @$internal
  @override
  $ProviderElement<MapCameraReader> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MapCameraReader create(Ref ref) {
    return mapCameraReader(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MapCameraReader value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MapCameraReader>(value),
    );
  }
}

String _$mapCameraReaderHash() => r'f48b2a86c7ce992fb986287effd31cab954c75ee';

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
        dependencies: null,
        $allTransitiveDependencies: null,
      );

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

String _$mapCameraChangesHash() => r'33cc1e90ab6d8dd1c7c98ed2a5018010ff9a89d5';

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

@ProviderFor(MapCameraControllerHolder)
final mapCameraControllerHolderProvider = MapCameraControllerHolderProvider._();

final class MapCameraControllerHolderProvider
    extends $NotifierProvider<MapCameraControllerHolder, MapCameraController?> {
  MapCameraControllerHolderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mapCameraControllerHolderProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mapCameraControllerHolderHash();

  @$internal
  @override
  MapCameraControllerHolder create() => MapCameraControllerHolder();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MapCameraController? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MapCameraController?>(value),
    );
  }
}

String _$mapCameraControllerHolderHash() =>
    r'b6859b39d4663f4d2caff406a1e30544055ed40d';

abstract class _$MapCameraControllerHolder
    extends $Notifier<MapCameraController?> {
  MapCameraController? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<MapCameraController?, MapCameraController?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<MapCameraController?, MapCameraController?>,
              MapCameraController?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(mapCameraControllerOrNull)
final mapCameraControllerOrNullProvider = MapCameraControllerOrNullProvider._();

final class MapCameraControllerOrNullProvider
    extends
        $FunctionalProvider<
          MapCameraController?,
          MapCameraController?,
          MapCameraController?
        >
    with $Provider<MapCameraController?> {
  MapCameraControllerOrNullProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mapCameraControllerOrNullProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mapCameraControllerOrNullHash();

  @$internal
  @override
  $ProviderElement<MapCameraController?> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  MapCameraController? create(Ref ref) {
    return mapCameraControllerOrNull(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MapCameraController? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MapCameraController?>(value),
    );
  }
}

String _$mapCameraControllerOrNullHash() =>
    r'7b8bdbdc2342fa7f2fd59ad31f4c5dd2a38eff2b';
