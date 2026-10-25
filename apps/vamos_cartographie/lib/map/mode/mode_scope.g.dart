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
          mapCameraProvider,
          cameraDirectorProvider,
        ],
        $allTransitiveDependencies: <ProviderOrFamily>[
          HandlerRegistryProvider.$allTransitiveDependencies0,
          HandlerRegistryProvider.$allTransitiveDependencies1,
        ],
      );

  static final $allTransitiveDependencies0 = mapCameraProvider;
  static final $allTransitiveDependencies1 = cameraDirectorProvider;

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

String _$handlerRegistryHash() => r'113c05073bad3b54db02f64444d43a1028cf2512';
