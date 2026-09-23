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
        dependencies: null,
        $allTransitiveDependencies: null,
      );

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

String _$mapCameraHolderHash() => r'e380e4d2f3a7bd938dd90c4cca0ce72fdbbb2b41';

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

/// Toujours utile si un widget doit se reconstruire quand la caméra bouge
/// (déplacement, zoom via geste utilisateur, etc.) — indépendant du fait
/// que l'animation soit attachée ou non.

@ProviderFor(MapCameraChanges)
final mapCameraChangesProvider = MapCameraChangesProvider._();

/// Toujours utile si un widget doit se reconstruire quand la caméra bouge
/// (déplacement, zoom via geste utilisateur, etc.) — indépendant du fait
/// que l'animation soit attachée ou non.
final class MapCameraChangesProvider
    extends $NotifierProvider<MapCameraChanges, int> {
  /// Toujours utile si un widget doit se reconstruire quand la caméra bouge
  /// (déplacement, zoom via geste utilisateur, etc.) — indépendant du fait
  /// que l'animation soit attachée ou non.
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

String _$mapCameraChangesHash() => r'c9e9d6e6a577a0dcfe1276ba34fa59939d92bdc6';

/// Toujours utile si un widget doit se reconstruire quand la caméra bouge
/// (déplacement, zoom via geste utilisateur, etc.) — indépendant du fait
/// que l'animation soit attachée ou non.

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
