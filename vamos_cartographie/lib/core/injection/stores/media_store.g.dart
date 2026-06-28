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
    extends
        $FunctionalProvider<
          ObservableMediaStore,
          ObservableMediaStore,
          ObservableMediaStore
        >
    with $Provider<ObservableMediaStore> {
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
  $ProviderElement<ObservableMediaStore> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ObservableMediaStore create(Ref ref) {
    return rawMediaStore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ObservableMediaStore value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ObservableMediaStore>(value),
    );
  }
}

String _$rawMediaStoreHash() => r'c166416682467aa6f3c4444562d95c1ac75d7955';

@ProviderFor(rawMediaPatchStore)
final rawMediaPatchStoreProvider = RawMediaPatchStoreProvider._();

final class RawMediaPatchStoreProvider
    extends
        $FunctionalProvider<
          ObservableMediaPatchStore,
          ObservableMediaPatchStore,
          ObservableMediaPatchStore
        >
    with $Provider<ObservableMediaPatchStore> {
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
  $ProviderElement<ObservableMediaPatchStore> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ObservableMediaPatchStore create(Ref ref) {
    return rawMediaPatchStore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ObservableMediaPatchStore value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ObservableMediaPatchStore>(value),
    );
  }
}

String _$rawMediaPatchStoreHash() =>
    r'9a9e5990f95d94e01aa885b5b27e3febb5fe9411';

@ProviderFor(rawUploadStateStore)
final rawUploadStateStoreProvider = RawUploadStateStoreProvider._();

final class RawUploadStateStoreProvider
    extends
        $FunctionalProvider<
          ObservableUploadStateStore,
          ObservableUploadStateStore,
          ObservableUploadStateStore
        >
    with $Provider<ObservableUploadStateStore> {
  RawUploadStateStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'rawUploadStateStoreProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$rawUploadStateStoreHash();

  @$internal
  @override
  $ProviderElement<ObservableUploadStateStore> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ObservableUploadStateStore create(Ref ref) {
    return rawUploadStateStore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ObservableUploadStateStore value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ObservableUploadStateStore>(value),
    );
  }
}

String _$rawUploadStateStoreHash() =>
    r'07032c9355bfed5110721e90dc574bfabcfa8dbb';

@ProviderFor(mediaStore)
final mediaStoreProvider = MediaStoreProvider._();

final class MediaStoreProvider
    extends
        $FunctionalProvider<
          ObservableMediaStore,
          ObservableMediaStore,
          ObservableMediaStore
        >
    with $Provider<ObservableMediaStore> {
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
  $ProviderElement<ObservableMediaStore> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ObservableMediaStore create(Ref ref) {
    return mediaStore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ObservableMediaStore value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ObservableMediaStore>(value),
    );
  }
}

String _$mediaStoreHash() => r'692a8bff55187f10334e68724f0168fd0bea580b';

@ProviderFor(mediaPatchStore)
final mediaPatchStoreProvider = MediaPatchStoreProvider._();

final class MediaPatchStoreProvider
    extends
        $FunctionalProvider<
          ObservableMediaPatchStore,
          ObservableMediaPatchStore,
          ObservableMediaPatchStore
        >
    with $Provider<ObservableMediaPatchStore> {
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
  $ProviderElement<ObservableMediaPatchStore> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ObservableMediaPatchStore create(Ref ref) {
    return mediaPatchStore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ObservableMediaPatchStore value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ObservableMediaPatchStore>(value),
    );
  }
}

String _$mediaPatchStoreHash() => r'd4bb6b9fd17c42eec4e5bfacbbe83c074c47e68f';

@ProviderFor(uploadStateStore)
final uploadStateStoreProvider = UploadStateStoreProvider._();

final class UploadStateStoreProvider
    extends
        $FunctionalProvider<
          ObservableUploadStateStore,
          ObservableUploadStateStore,
          ObservableUploadStateStore
        >
    with $Provider<ObservableUploadStateStore> {
  UploadStateStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'uploadStateStoreProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$uploadStateStoreHash();

  @$internal
  @override
  $ProviderElement<ObservableUploadStateStore> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ObservableUploadStateStore create(Ref ref) {
    return uploadStateStore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ObservableUploadStateStore value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ObservableUploadStateStore>(value),
    );
  }
}

String _$uploadStateStoreHash() => r'6362cf21b37c57c7a39678d20f1ad6fdb33d4cf7';
