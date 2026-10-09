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
          Mode<Mode<dynamic>>,
          Mode<Mode<dynamic>>,
          Mode<Mode<dynamic>>
        >
    with $Provider<Mode<Mode<dynamic>>> {
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
  $ProviderElement<Mode<Mode<dynamic>>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  Mode<Mode<dynamic>> create(Ref ref) {
    return mapMode(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Mode<Mode<dynamic>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Mode<Mode<dynamic>>>(value),
    );
  }
}

String _$mapModeHash() => r'115ef6bc2f8d161e934cfa65e96cf2d3f2e54b2e';

@ProviderFor(modeDecorator)
final modeDecoratorProvider = ModeDecoratorProvider._();

final class ModeDecoratorProvider
    extends
        $FunctionalProvider<
          Overlay<Mode<dynamic>>?,
          Overlay<Mode<dynamic>>?,
          Overlay<Mode<dynamic>>?
        >
    with $Provider<Overlay<Mode<dynamic>>?> {
  ModeDecoratorProvider._()
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
  $ProviderElement<Overlay<Mode<dynamic>>?> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  Overlay<Mode<dynamic>>? create(Ref ref) {
    return modeDecorator(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Overlay<Mode<dynamic>>? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Overlay<Mode<dynamic>>?>(value),
    );
  }
}

String _$modeDecoratorHash() => r'58c4b1d0bd749359ddb29a0dac53b3af82820788';

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
