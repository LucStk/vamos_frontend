// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'camera_director_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(cameraDirector)
final cameraDirectorProvider = CameraDirectorProvider._();

final class CameraDirectorProvider
    extends $FunctionalProvider<CameraDirector, CameraDirector, CameraDirector>
    with $Provider<CameraDirector> {
  CameraDirectorProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cameraDirectorProvider',
        isAutoDispose: true,
        dependencies: <ProviderOrFamily>[mapCameraProvider],
        $allTransitiveDependencies: <ProviderOrFamily>[
          CameraDirectorProvider.$allTransitiveDependencies0,
        ],
      );

  static final $allTransitiveDependencies0 = mapCameraProvider;

  @override
  String debugGetCreateSourceHash() => _$cameraDirectorHash();

  @$internal
  @override
  $ProviderElement<CameraDirector> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  CameraDirector create(Ref ref) {
    return cameraDirector(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CameraDirector value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CameraDirector>(value),
    );
  }
}

String _$cameraDirectorHash() => r'ed419a1d1751306b2e1d8df83d32345d974c93e4';
