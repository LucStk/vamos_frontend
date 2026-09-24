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
        dependencies: null,
        $allTransitiveDependencies: null,
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

String _$cameraDirectorHash() => r'6d7699b39fac212535fb75631d8e33e1a8036d1a';
