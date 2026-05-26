// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_img_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(uploadImgRepository)
final uploadImgRepositoryProvider = UploadImgRepositoryProvider._();

final class UploadImgRepositoryProvider
    extends
        $FunctionalProvider<
          UploadImgRepository,
          UploadImgRepository,
          UploadImgRepository
        >
    with $Provider<UploadImgRepository> {
  UploadImgRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'uploadImgRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$uploadImgRepositoryHash();

  @$internal
  @override
  $ProviderElement<UploadImgRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  UploadImgRepository create(Ref ref) {
    return uploadImgRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UploadImgRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UploadImgRepository>(value),
    );
  }
}

String _$uploadImgRepositoryHash() =>
    r'879d8691a7145c904670cd43e0a9e76e12677f5d';
