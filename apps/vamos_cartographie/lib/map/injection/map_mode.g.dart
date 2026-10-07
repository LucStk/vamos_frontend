// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_mode.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(mapMode)
final mapModeProvider = MapModeProvider._();

final class MapModeProvider
    extends
        $FunctionalProvider<
          BaseMode<BaseMode<dynamic>>,
          BaseMode<BaseMode<dynamic>>,
          BaseMode<BaseMode<dynamic>>
        >
    with $Provider<BaseMode<BaseMode<dynamic>>> {
  MapModeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mapModeProvider',
        isAutoDispose: false,
        dependencies: <ProviderOrFamily>[],
        $allTransitiveDependencies: <ProviderOrFamily>[],
      );

  @override
  String debugGetCreateSourceHash() => _$mapModeHash();

  @$internal
  @override
  $ProviderElement<BaseMode<BaseMode<dynamic>>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  BaseMode<BaseMode<dynamic>> create(Ref ref) {
    return mapMode(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BaseMode<BaseMode<dynamic>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BaseMode<BaseMode<dynamic>>>(value),
    );
  }
}

String _$mapModeHash() => r'aca14f8ee1b4ab6ce55cf425cada2c57f29bc517';

@ProviderFor(mapDecorator)
final mapDecoratorProvider = MapDecoratorProvider._();

final class MapDecoratorProvider
    extends
        $FunctionalProvider<
          ModeDecorator<BaseMode<dynamic>>?,
          ModeDecorator<BaseMode<dynamic>>?,
          ModeDecorator<BaseMode<dynamic>>?
        >
    with $Provider<ModeDecorator<BaseMode<dynamic>>?> {
  MapDecoratorProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mapDecoratorProvider',
        isAutoDispose: false,
        dependencies: <ProviderOrFamily>[],
        $allTransitiveDependencies: <ProviderOrFamily>[],
      );

  @override
  String debugGetCreateSourceHash() => _$mapDecoratorHash();

  @$internal
  @override
  $ProviderElement<ModeDecorator<BaseMode<dynamic>>?> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ModeDecorator<BaseMode<dynamic>>? create(Ref ref) {
    return mapDecorator(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ModeDecorator<BaseMode<dynamic>>? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ModeDecorator<BaseMode<dynamic>>?>(
        value,
      ),
    );
  }
}

String _$mapDecoratorHash() => r'9407199ae768ae48299762ce0d5bf7b780336ab6';

@ProviderFor(mapModeController)
final mapModeControllerProvider = MapModeControllerProvider._();

final class MapModeControllerProvider
    extends $FunctionalProvider<ModeHost, ModeHost, ModeHost>
    with $Provider<ModeHost> {
  MapModeControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mapModeControllerProvider',
        isAutoDispose: false,
        dependencies: <ProviderOrFamily>[],
        $allTransitiveDependencies: <ProviderOrFamily>[],
      );

  @override
  String debugGetCreateSourceHash() => _$mapModeControllerHash();

  @$internal
  @override
  $ProviderElement<ModeHost> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ModeHost create(Ref ref) {
    return mapModeController(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ModeHost value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ModeHost>(value),
    );
  }
}

String _$mapModeControllerHash() => r'a8696af3f6a8ba6f9884823c6c2a2f02ad9ce7cb';
