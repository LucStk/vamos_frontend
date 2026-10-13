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

@ProviderFor(modeOverlay)
final modeOverlayProvider = ModeOverlayProvider._();

final class ModeOverlayProvider
    extends
        $FunctionalProvider<
          Overlay<Mode<dynamic>>?,
          Overlay<Mode<dynamic>>?,
          Overlay<Mode<dynamic>>?
        >
    with $Provider<Overlay<Mode<dynamic>>?> {
  ModeOverlayProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'modeOverlayProvider',
        isAutoDispose: false,
        dependencies: <ProviderOrFamily>[],
        $allTransitiveDependencies: <ProviderOrFamily>[],
      );

  @override
  String debugGetCreateSourceHash() => _$modeOverlayHash();

  @$internal
  @override
  $ProviderElement<Overlay<Mode<dynamic>>?> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  Overlay<Mode<dynamic>>? create(Ref ref) {
    return modeOverlay(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Overlay<Mode<dynamic>>? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Overlay<Mode<dynamic>>?>(value),
    );
  }
}

String _$modeOverlayHash() => r'1daeccacb3ad716cf10f080751f1fb6b8b0fdb17';

@ProviderFor(modeState)
final modeStateProvider = ModeStateProvider._();

final class ModeStateProvider
    extends
        $FunctionalProvider<
          ModeState<Mode<dynamic>>,
          ModeState<Mode<dynamic>>,
          ModeState<Mode<dynamic>>
        >
    with $Provider<ModeState<Mode<dynamic>>> {
  ModeStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'modeStateProvider',
        isAutoDispose: false,
        dependencies: <ProviderOrFamily>[],
        $allTransitiveDependencies: <ProviderOrFamily>[],
      );

  @override
  String debugGetCreateSourceHash() => _$modeStateHash();

  @$internal
  @override
  $ProviderElement<ModeState<Mode<dynamic>>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ModeState<Mode<dynamic>> create(Ref ref) {
    return modeState(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ModeState<Mode<dynamic>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ModeState<Mode<dynamic>>>(value),
    );
  }
}

String _$modeStateHash() => r'82b6a0a9605b578dd872e513d92b933a2488a34a';

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
