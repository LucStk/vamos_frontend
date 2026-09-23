// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gesture_handler_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(mapGestureHandler)
final mapGestureHandlerProvider = MapGestureHandlerFamily._();

final class MapGestureHandlerProvider
    extends
        $FunctionalProvider<
          MapGestureHandler,
          MapGestureHandler,
          MapGestureHandler
        >
    with $Provider<MapGestureHandler> {
  MapGestureHandlerProvider._({
    required MapGestureHandlerFamily super.from,
    required (ProviderListenable<MapScene>, BaseController<BaseMode<dynamic>>)
    super.argument,
  }) : super(
         retry: null,
         name: r'mapGestureHandlerProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$mapGestureHandlerHash();

  @override
  String toString() {
    return r'mapGestureHandlerProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<MapGestureHandler> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  MapGestureHandler create(Ref ref) {
    final argument =
        this.argument
            as (
              ProviderListenable<MapScene>,
              BaseController<BaseMode<dynamic>>,
            );
    return mapGestureHandler(ref, argument.$1, argument.$2);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MapGestureHandler value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MapGestureHandler>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is MapGestureHandlerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$mapGestureHandlerHash() => r'a7966ae832ce178f4827c78f5f74398398c2f21f';

final class MapGestureHandlerFamily extends $Family
    with
        $FunctionalFamilyOverride<
          MapGestureHandler,
          (ProviderListenable<MapScene>, BaseController<BaseMode<dynamic>>)
        > {
  MapGestureHandlerFamily._()
    : super(
        retry: null,
        name: r'mapGestureHandlerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  MapGestureHandlerProvider call(
    ProviderListenable<MapScene> scene,
    BaseController<BaseMode<dynamic>> controller,
  ) => MapGestureHandlerProvider._(argument: (scene, controller), from: this);

  @override
  String toString() => r'mapGestureHandlerProvider';
}
