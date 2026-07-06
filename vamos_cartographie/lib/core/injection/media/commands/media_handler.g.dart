// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_handler.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(mediaHandler)
final mediaHandlerProvider = MediaHandlerProvider._();

final class MediaHandlerProvider
    extends $FunctionalProvider<MediaHandler, MediaHandler, MediaHandler>
    with $Provider<MediaHandler> {
  MediaHandlerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mediaHandlerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mediaHandlerHash();

  @$internal
  @override
  $ProviderElement<MediaHandler> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MediaHandler create(Ref ref) {
    return mediaHandler(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MediaHandler value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MediaHandler>(value),
    );
  }
}

String _$mediaHandlerHash() => r'fb489a087acc9d3b24543a85c8e68ebf0544b060';
