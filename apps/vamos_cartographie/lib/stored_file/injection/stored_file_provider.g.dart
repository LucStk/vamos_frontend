// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stored_file_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(storedFileRemoteDatasource)
final storedFileRemoteDatasourceProvider =
    StoredFileRemoteDatasourceProvider._();

final class StoredFileRemoteDatasourceProvider
    extends
        $FunctionalProvider<
          StoredFileRemoteDatasource,
          StoredFileRemoteDatasource,
          StoredFileRemoteDatasource
        >
    with $Provider<StoredFileRemoteDatasource> {
  StoredFileRemoteDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'storedFileRemoteDatasourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$storedFileRemoteDatasourceHash();

  @$internal
  @override
  $ProviderElement<StoredFileRemoteDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  StoredFileRemoteDatasource create(Ref ref) {
    return storedFileRemoteDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(StoredFileRemoteDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<StoredFileRemoteDatasource>(value),
    );
  }
}

String _$storedFileRemoteDatasourceHash() =>
    r'5b2a662c24b2f697fbb2aed08a6e62ed75562847';

@ProviderFor(storedFileRepository)
final storedFileRepositoryProvider = StoredFileRepositoryProvider._();

final class StoredFileRepositoryProvider
    extends
        $FunctionalProvider<
          StoredFileRepository,
          StoredFileRepository,
          StoredFileRepository
        >
    with $Provider<StoredFileRepository> {
  StoredFileRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'storedFileRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$storedFileRepositoryHash();

  @$internal
  @override
  $ProviderElement<StoredFileRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  StoredFileRepository create(Ref ref) {
    return storedFileRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(StoredFileRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<StoredFileRepository>(value),
    );
  }
}

String _$storedFileRepositoryHash() =>
    r'9028cd8a1b32fd86c16af8d39a4cc00dd7534c9d';

@ProviderFor(uploadService)
final uploadServiceProvider = UploadServiceProvider._();

final class UploadServiceProvider
    extends $FunctionalProvider<UploadService, UploadService, UploadService>
    with $Provider<UploadService> {
  UploadServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'uploadServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$uploadServiceHash();

  @$internal
  @override
  $ProviderElement<UploadService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  UploadService create(Ref ref) {
    return uploadService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UploadService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UploadService>(value),
    );
  }
}

String _$uploadServiceHash() => r'1e538af622aaaba2a7dee9aae81d4f7ffb2a26c4';

@ProviderFor(StoredFileStoreNotifier)
final storedFileStoreProvider = StoredFileStoreNotifierProvider._();

final class StoredFileStoreNotifierProvider
    extends $NotifierProvider<StoredFileStoreNotifier, StoredFileStore> {
  StoredFileStoreNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'storedFileStoreProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$storedFileStoreNotifierHash();

  @$internal
  @override
  StoredFileStoreNotifier create() => StoredFileStoreNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(StoredFileStore value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<StoredFileStore>(value),
    );
  }
}

String _$storedFileStoreNotifierHash() =>
    r'f32e587db832d9a1e4dcfefeed8de659fb7f13ee';

abstract class _$StoredFileStoreNotifier extends $Notifier<StoredFileStore> {
  StoredFileStore build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<StoredFileStore, StoredFileStore>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<StoredFileStore, StoredFileStore>,
              StoredFileStore,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
