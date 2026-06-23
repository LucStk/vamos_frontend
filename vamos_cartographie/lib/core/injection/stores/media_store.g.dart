// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_store.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(mediaRemoteDatasource)
final mediaRemoteDatasourceProvider = MediaRemoteDatasourceProvider._();

final class MediaRemoteDatasourceProvider
    extends
        $FunctionalProvider<
          MediaRemoteDatasource,
          MediaRemoteDatasource,
          MediaRemoteDatasource
        >
    with $Provider<MediaRemoteDatasource> {
  MediaRemoteDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mediaRemoteDatasourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mediaRemoteDatasourceHash();

  @$internal
  @override
  $ProviderElement<MediaRemoteDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  MediaRemoteDatasource create(Ref ref) {
    return mediaRemoteDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MediaRemoteDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MediaRemoteDatasource>(value),
    );
  }
}

String _$mediaRemoteDatasourceHash() =>
    r'7edfde00e540563423d66631ba08fe343f60c203';

@ProviderFor(mediaRepository)
final mediaRepositoryProvider = MediaRepositoryProvider._();

final class MediaRepositoryProvider
    extends
        $FunctionalProvider<MediaRepository, MediaRepository, MediaRepository>
    with $Provider<MediaRepository> {
  MediaRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mediaRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mediaRepositoryHash();

  @$internal
  @override
  $ProviderElement<MediaRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MediaRepository create(Ref ref) {
    return mediaRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MediaRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MediaRepository>(value),
    );
  }
}

String _$mediaRepositoryHash() => r'3c50ffc9e49d2cfcd3b3243fa551adc8ccc9e244';

@ProviderFor(rawMediaStore)
final rawMediaStoreProvider = RawMediaStoreProvider._();

final class RawMediaStoreProvider
    extends $FunctionalProvider<MediaStore, MediaStore, MediaStore>
    with $Provider<MediaStore> {
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
  $ProviderElement<MediaStore> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MediaStore create(Ref ref) {
    return rawMediaStore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MediaStore value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MediaStore>(value),
    );
  }
}

String _$rawMediaStoreHash() => r'3e7b349abf18d714772b5cd5edef48ab40c58815';

@ProviderFor(rawMediaPatchStore)
final rawMediaPatchStoreProvider = RawMediaPatchStoreProvider._();

final class RawMediaPatchStoreProvider
    extends
        $FunctionalProvider<MediaPatchStore, MediaPatchStore, MediaPatchStore>
    with $Provider<MediaPatchStore> {
  RawMediaPatchStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'rawMediaPatchStoreProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$rawMediaPatchStoreHash();

  @$internal
  @override
  $ProviderElement<MediaPatchStore> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MediaPatchStore create(Ref ref) {
    return rawMediaPatchStore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MediaPatchStore value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MediaPatchStore>(value),
    );
  }
}

String _$rawMediaPatchStoreHash() =>
    r'8e5c6551148ad80dc330fe23f8942dab210632b0';

@ProviderFor(mediaStore)
final mediaStoreProvider = MediaStoreProvider._();

final class MediaStoreProvider
    extends
        $FunctionalProvider<
          AsyncValue<Map<FileKey, MediaImage>>,
          Map<FileKey, MediaImage>,
          Stream<Map<FileKey, MediaImage>>
        >
    with
        $FutureModifier<Map<FileKey, MediaImage>>,
        $StreamProvider<Map<FileKey, MediaImage>> {
  MediaStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mediaStoreProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mediaStoreHash();

  @$internal
  @override
  $StreamProviderElement<Map<FileKey, MediaImage>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<Map<FileKey, MediaImage>> create(Ref ref) {
    return mediaStore(ref);
  }
}

String _$mediaStoreHash() => r'65f0c2c9228eee48be21aa390725dce0ad0eada7';

@ProviderFor(mediaPatchStore)
final mediaPatchStoreProvider = MediaPatchStoreProvider._();

final class MediaPatchStoreProvider
    extends
        $FunctionalProvider<
          AsyncValue<Map<FileKey, PatchImageMedia>>,
          Map<FileKey, PatchImageMedia>,
          Stream<Map<FileKey, PatchImageMedia>>
        >
    with
        $FutureModifier<Map<FileKey, PatchImageMedia>>,
        $StreamProvider<Map<FileKey, PatchImageMedia>> {
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
  $StreamProviderElement<Map<FileKey, PatchImageMedia>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<Map<FileKey, PatchImageMedia>> create(Ref ref) {
    return mediaPatchStore(ref);
  }
}

String _$mediaPatchStoreHash() => r'3dde2171f348f06eee9d4b32e29e3e07d5e9e51c';
