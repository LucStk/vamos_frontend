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

  static final $allTransitiveDependencies0 = mapHitTestProvider;
  static final $allTransitiveDependencies1 =
      MapHitTestProvider.$allTransitiveDependencies0;
  static final $allTransitiveDependencies2 =
      MapHitTestProvider.$allTransitiveDependencies1;

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

String _$mapGestureHandlerHash() => r'2d478585f6ad93276acf45b3b92e375b07365eb3';

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
        dependencies: <ProviderOrFamily>[mapHitTestProvider],
        $allTransitiveDependencies: <ProviderOrFamily>[
          MapGestureHandlerProvider.$allTransitiveDependencies0,
          MapGestureHandlerProvider.$allTransitiveDependencies1,
          MapGestureHandlerProvider.$allTransitiveDependencies2,
        ],
        isAutoDispose: false,
      );

  MapGestureHandlerProvider call(
    ProviderListenable<MapScene> scene,
    BaseController<BaseMode<dynamic>> controller,
  ) => MapGestureHandlerProvider._(argument: (scene, controller), from: this);

  @override
  String toString() => r'mapGestureHandlerProvider';
}
