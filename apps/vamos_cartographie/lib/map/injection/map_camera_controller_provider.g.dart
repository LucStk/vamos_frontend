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

@ProviderFor(CameraRevision)
final cameraRevisionProvider = CameraRevisionFamily._();

final class CameraRevisionProvider
    extends $NotifierProvider<CameraRevision, int> {
  CameraRevisionProvider._({
    required CameraRevisionFamily super.from,
    required TripId super.argument,
  }) : super(
         retry: null,
         name: r'cameraRevisionProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$cameraRevisionHash();

  @override
  String toString() {
    return r'cameraRevisionProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  CameraRevision create() => CameraRevision();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CameraRevisionProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$cameraRevisionHash() => r'8ff0757705f6a3590bc3d06a115f99148308e6f3';

final class CameraRevisionFamily extends $Family
    with $ClassFamilyOverride<CameraRevision, int, int, int, TripId> {
  CameraRevisionFamily._()
    : super(
        retry: null,
        name: r'cameraRevisionProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  CameraRevisionProvider call(TripId tripId) =>
      CameraRevisionProvider._(argument: tripId, from: this);

  @override
  String toString() => r'cameraRevisionProvider';
}

abstract class _$CameraRevision extends $Notifier<int> {
  late final _$args = ref.$arg as TripId;
  TripId get tripId => _$args;

  int build(TripId tripId);
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
    element.handleCreate(ref, () => build(_$args));
  }
}
