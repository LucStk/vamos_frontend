// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_store.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(rawMediaStore)
final rawMediaStoreProvider = RawMediaStoreProvider._();

final class RawMediaStoreProvider
    extends
        $FunctionalProvider<
          MediaStore<dynamic>,
          MediaStore<dynamic>,
          MediaStore<dynamic>
        >
    with $Provider<MediaStore<dynamic>> {
  RawMediaStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'rawMediaStoreProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$rawMediaStoreHash();

  @$internal
  @override
  $ProviderElement<MediaStore<dynamic>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  MediaStore<dynamic> create(Ref ref) {
    return rawMediaStore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MediaStore<dynamic> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MediaStore<dynamic>>(value),
    );
  }
}

String _$rawMediaStoreHash() => r'd490d65bdb71f08f43ee8f8b4c7ceea4d37b0fc0';

@ProviderFor(mediaPatchStore)
final mediaPatchStoreProvider = MediaPatchStoreProvider._();

final class MediaPatchStoreProvider
    extends
        $FunctionalProvider<MediaPatchStore, MediaPatchStore, MediaPatchStore>
    with $Provider<MediaPatchStore> {
  MediaPatchStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mediaPatchStoreProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mediaPatchStoreHash();

  @$internal
  @override
  $ProviderElement<MediaPatchStore> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MediaPatchStore create(Ref ref) {
    return mediaPatchStore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MediaPatchStore value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MediaPatchStore>(value),
    );
  }
}

String _$mediaPatchStoreHash() => r'6352d12c203f52950299e4cf06c4ff7324b2a627';

@ProviderFor(imageProjector)
final imageProjectorProvider = ImageProjectorProvider._();

final class ImageProjectorProvider
    extends $FunctionalProvider<ImageProjector, ImageProjector, ImageProjector>
    with $Provider<ImageProjector> {
  ImageProjectorProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'imageProjectorProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$imageProjectorHash();

  @$internal
  @override
  $ProviderElement<ImageProjector> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ImageProjector create(Ref ref) {
    return imageProjector(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ImageProjector value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ImageProjector>(value),
    );
  }
}

String _$imageProjectorHash() => r'77e0b1ba1705df5a3fe088bc55d21feba5faf7d2';
