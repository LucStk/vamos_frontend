// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_context_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(mapContext)
final mapContextProvider = MapContextProvider._();

final class MapContextProvider
    extends $FunctionalProvider<MapContext, MapContext, MapContext>
    with $Provider<MapContext> {
  MapContextProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mapContextProvider',
        isAutoDispose: false,
        dependencies: <ProviderOrFamily>[],
        $allTransitiveDependencies: <ProviderOrFamily>[],
      );

  @override
  String debugGetCreateSourceHash() => _$mapContextHash();

  @$internal
  @override
  $ProviderElement<MapContext> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MapContext create(Ref ref) {
    return mapContext(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MapContext value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MapContext>(value),
    );
  }
}

String _$mapContextHash() => r'8b6d12d99c21bdce2b0bcb0cf281f1453db166d1';

@ProviderFor(mapController)
final mapControllerProvider = MapControllerProvider._();

final class MapControllerProvider
    extends
        $FunctionalProvider<
          BaseController<BaseMode<BaseMode<dynamic>>>,
          BaseController<BaseMode<BaseMode<dynamic>>>,
          BaseController<BaseMode<BaseMode<dynamic>>>
        >
    with $Provider<BaseController<BaseMode<BaseMode<dynamic>>>> {
  MapControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mapControllerProvider',
        isAutoDispose: false,
        dependencies: <ProviderOrFamily>[],
        $allTransitiveDependencies: <ProviderOrFamily>[],
      );

  @override
  String debugGetCreateSourceHash() => _$mapControllerHash();

  @$internal
  @override
  $ProviderElement<BaseController<BaseMode<BaseMode<dynamic>>>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  BaseController<BaseMode<BaseMode<dynamic>>> create(Ref ref) {
    return mapController(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(
    BaseController<BaseMode<BaseMode<dynamic>>> value,
  ) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<BaseController<BaseMode<BaseMode<dynamic>>>>(
            value,
          ),
    );
  }
}

String _$mapControllerHash() => r'8f36cc9976c4388cc2255767dbb9a4cfdb516350';
