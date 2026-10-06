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
        dependencies: <ProviderOrFamily>[],
        $allTransitiveDependencies: <ProviderOrFamily>[],
      );

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

String _$cameraDirectorHash() => r'e125815cf269ba197ede233b5c9f6a07826ab9b5';
