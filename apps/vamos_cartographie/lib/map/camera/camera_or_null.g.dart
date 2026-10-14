// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'camera_or_null.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CameraOrNull)
final cameraOrNullProvider = CameraOrNullProvider._();

final class CameraOrNullProvider
    extends $NotifierProvider<CameraOrNull, MapCameraController?> {
  CameraOrNullProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cameraOrNullProvider',
        isAutoDispose: false,
        dependencies: <ProviderOrFamily>[],
        $allTransitiveDependencies: <ProviderOrFamily>[],
      );

  @override
  String debugGetCreateSourceHash() => _$cameraOrNullHash();

  @$internal
  @override
  CameraOrNull create() => CameraOrNull();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MapCameraController? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MapCameraController?>(value),
    );
  }
}

String _$cameraOrNullHash() => r'42423607de78065c636c5f25f86859ffaea17444';

abstract class _$CameraOrNull extends $Notifier<MapCameraController?> {
  MapCameraController? build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<MapCameraController?, MapCameraController?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<MapCameraController?, MapCameraController?>,
              MapCameraController?,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
