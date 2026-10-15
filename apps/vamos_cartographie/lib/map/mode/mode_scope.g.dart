// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mode_scope.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(handlerRegistry)
final handlerRegistryProvider = HandlerRegistryProvider._();

final class HandlerRegistryProvider
    extends
        $FunctionalProvider<HandlerRegistry, HandlerRegistry, HandlerRegistry>
    with $Provider<HandlerRegistry> {
  HandlerRegistryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'handlerRegistryProvider',
        isAutoDispose: false,
        dependencies: <ProviderOrFamily>[
          mapModeProvider,
          mapCameraProvider,
          cameraDirectorProvider,
        ],
        $allTransitiveDependencies: <ProviderOrFamily>[
          HandlerRegistryProvider.$allTransitiveDependencies0,
          HandlerRegistryProvider.$allTransitiveDependencies1,
          HandlerRegistryProvider.$allTransitiveDependencies2,
        ],
      );

  static final $allTransitiveDependencies0 = mapModeProvider;
  static final $allTransitiveDependencies1 = mapCameraProvider;
  static final $allTransitiveDependencies2 = cameraDirectorProvider;

  @override
  String debugGetCreateSourceHash() => _$handlerRegistryHash();

  @$internal
  @override
  $ProviderElement<HandlerRegistry> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  HandlerRegistry create(Ref ref) {
    return handlerRegistry(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HandlerRegistry value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HandlerRegistry>(value),
    );
  }
}

String _$handlerRegistryHash() => r'818c9d12a6601791a8e25e350b64a673a6022b4a';
