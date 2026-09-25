// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_gesture_handler_provider.dart';

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
    required BaseController<BaseMode<BaseMode<dynamic>>> super.argument,
  }) : super(
         retry: null,
         name: r'mapGestureHandlerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$mapGestureHandlerHash();

  @override
  String toString() {
    return r'mapGestureHandlerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<MapGestureHandler> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  MapGestureHandler create(Ref ref) {
    final argument =
        this.argument as BaseController<BaseMode<BaseMode<dynamic>>>;
    return mapGestureHandler(ref, argument);
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

String _$mapGestureHandlerHash() => r'8928bc2b93233bae439cba443f922d7a637d8569';

final class MapGestureHandlerFamily extends $Family
    with
        $FunctionalFamilyOverride<
          MapGestureHandler,
          BaseController<BaseMode<BaseMode<dynamic>>>
        > {
  MapGestureHandlerFamily._()
    : super(
        retry: null,
        name: r'mapGestureHandlerProvider',
        dependencies: <ProviderOrFamily>[],
        $allTransitiveDependencies: <ProviderOrFamily>[],
        isAutoDispose: true,
      );

  MapGestureHandlerProvider call(
    BaseController<BaseMode<BaseMode<dynamic>>> controller,
  ) => MapGestureHandlerProvider._(argument: controller, from: this);

  @override
  String toString() => r'mapGestureHandlerProvider';
}
