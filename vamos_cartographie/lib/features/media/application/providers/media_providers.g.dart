// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(uploadMediaUseCase)
final uploadMediaUseCaseProvider = UploadMediaUseCaseProvider._();

final class UploadMediaUseCaseProvider
    extends
        $FunctionalProvider<
          UploadMediaUseCase,
          UploadMediaUseCase,
          UploadMediaUseCase
        >
    with $Provider<UploadMediaUseCase> {
  UploadMediaUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'uploadMediaUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$uploadMediaUseCaseHash();

  @$internal
  @override
  $ProviderElement<UploadMediaUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  UploadMediaUseCase create(Ref ref) {
    return uploadMediaUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UploadMediaUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UploadMediaUseCase>(value),
    );
  }
}

String _$uploadMediaUseCaseHash() =>
    r'18da76ca9fcfb4ac684f2840e235e03acdd065af';

@ProviderFor(uploadCarouselImageController)
final uploadCarouselImageControllerProvider =
    UploadCarouselImageControllerProvider._();

final class UploadCarouselImageControllerProvider
    extends
        $FunctionalProvider<
          UploadCarouselImageController,
          UploadCarouselImageController,
          UploadCarouselImageController
        >
    with $Provider<UploadCarouselImageController> {
  UploadCarouselImageControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'uploadCarouselImageControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$uploadCarouselImageControllerHash();

  @$internal
  @override
  $ProviderElement<UploadCarouselImageController> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  UploadCarouselImageController create(Ref ref) {
    return uploadCarouselImageController(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UploadCarouselImageController value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UploadCarouselImageController>(
        value,
      ),
    );
  }
}

String _$uploadCarouselImageControllerHash() =>
    r'06077c8cc06f7f498d26e69ae8f7e6e4ed7538d0';
