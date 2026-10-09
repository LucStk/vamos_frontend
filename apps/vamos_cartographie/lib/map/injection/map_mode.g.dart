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

@ProviderFor(modeDecorator)
final modeDecoratorProvider = OverlayProvider._();

final class OverlayProvider
    extends
        $FunctionalProvider<
          Overlay<BaseMode<dynamic>>?,
          Overlay<BaseMode<dynamic>>?,
          Overlay<BaseMode<dynamic>>?
        >
    with $Provider<Overlay<BaseMode<dynamic>>?> {
  OverlayProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'modeDecoratorProvider',
        isAutoDispose: false,
        dependencies: <ProviderOrFamily>[],
        $allTransitiveDependencies: <ProviderOrFamily>[],
      );

  @override
  String debugGetCreateSourceHash() => _$modeDecoratorHash();

  @$internal
  @override
  $ProviderElement<Overlay<BaseMode<dynamic>>?> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  Overlay<BaseMode<dynamic>>? create(Ref ref) {
    return modeDecorator(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Overlay<BaseMode<dynamic>>? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Overlay<BaseMode<dynamic>>?>(value),
    );
  }
}

String _$modeDecoratorHash() => r'3fa7106a0a529181bed84ddb626aeef07fdffead';

@ProviderFor(modeContext)
final modeContextProvider = ModeContextProvider._();

final class ModeContextProvider
    extends $FunctionalProvider<ModeContext, ModeContext, ModeContext>
    with $Provider<ModeContext> {
  ModeContextProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'modeContextProvider',
        isAutoDispose: false,
        dependencies: <ProviderOrFamily>[],
        $allTransitiveDependencies: <ProviderOrFamily>[],
      );

  @override
  String debugGetCreateSourceHash() => _$modeContextHash();

  @$internal
  @override
  $ProviderElement<ModeContext> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ModeContext create(Ref ref) {
    return modeContext(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ModeContext value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ModeContext>(value),
    );
  }
}

String _$modeContextHash() => r'b8462fbab2c897c113e2330a6ca27fc0a2b19bdb';

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
