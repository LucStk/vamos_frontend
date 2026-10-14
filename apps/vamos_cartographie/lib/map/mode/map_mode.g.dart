// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_mode.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ModeStateNotifier)
final modeStateProvider = ModeStateNotifierProvider._();

final class ModeStateNotifierProvider
    extends $NotifierProvider<ModeStateNotifier, AppModeState> {
  ModeStateNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'modeStateProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$modeStateNotifierHash();

  @$internal
  @override
  ModeStateNotifier create() => ModeStateNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppModeState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppModeState>(value),
    );
  }
}

String _$modeStateNotifierHash() => r'f6f6cd4b255efacaf3e7892dce9baf453c85a43e';

abstract class _$ModeStateNotifier extends $Notifier<AppModeState> {
  AppModeState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AppModeState, AppModeState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AppModeState, AppModeState>,
              AppModeState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(modeMachine)
final modeMachineProvider = ModeMachineProvider._();

final class ModeMachineProvider
    extends $FunctionalProvider<AppModeMachine, AppModeMachine, AppModeMachine>
    with $Provider<AppModeMachine> {
  ModeMachineProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'modeMachineProvider',
        isAutoDispose: false,
        dependencies: <ProviderOrFamily>[],
        $allTransitiveDependencies: <ProviderOrFamily>[],
      );

  @override
  String debugGetCreateSourceHash() => _$modeMachineHash();

  @$internal
  @override
  $ProviderElement<AppModeMachine> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AppModeMachine create(Ref ref) {
    return modeMachine(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppModeMachine value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppModeMachine>(value),
    );
  }
}

String _$modeMachineHash() => r'9136970cbfc52f5ebbcd5111d8b8b941e8ffb3c4';

@ProviderFor(mapMode)
final mapModeProvider = MapModeProvider._();

final class MapModeProvider
    extends $FunctionalProvider<AppMode, AppMode, AppMode>
    with $Provider<AppMode> {
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
  $ProviderElement<AppMode> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AppMode create(Ref ref) {
    return mapMode(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppMode value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppMode>(value),
    );
  }
}

String _$mapModeHash() => r'92cfe10cd2ee0d4f6ea79e78bacda9aeeda26b41';

@ProviderFor(modeOverlay)
final modeOverlayProvider = ModeOverlayProvider._();

final class ModeOverlayProvider
    extends $FunctionalProvider<AppOverlay?, AppOverlay?, AppOverlay?>
    with $Provider<AppOverlay?> {
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
  $ProviderElement<AppOverlay?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AppOverlay? create(Ref ref) {
    return modeOverlay(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppOverlay? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppOverlay?>(value),
    );
  }
}

String _$modeOverlayHash() => r'd8ac02cdf0fef3cf5e12641af0dd80c36fc94ca8';

@ProviderFor(modeSelection)
final modeSelectionProvider = ModeSelectionProvider._();

final class ModeSelectionProvider
    extends $FunctionalProvider<Selectable?, Selectable?, Selectable?>
    with $Provider<Selectable?> {
  ModeSelectionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'modeSelectionProvider',
        isAutoDispose: false,
        dependencies: <ProviderOrFamily>[],
        $allTransitiveDependencies: <ProviderOrFamily>[],
      );

  @override
  String debugGetCreateSourceHash() => _$modeSelectionHash();

  @$internal
  @override
  $ProviderElement<Selectable?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Selectable? create(Ref ref) {
    return modeSelection(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Selectable? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Selectable?>(value),
    );
  }
}

String _$modeSelectionHash() => r'0c8da05f2e84ae36d6bd4bc0a477a08e3e4f66ef';

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
        dependencies: <ProviderOrFamily>[modeMachineProvider],
        $allTransitiveDependencies: <ProviderOrFamily>[
          MapModeControllerProvider.$allTransitiveDependencies0,
        ],
      );

  static final $allTransitiveDependencies0 = modeMachineProvider;

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

String _$mapModeControllerHash() => r'11ddfa3c15acb254579db8bb3b4d5dba904ca30e';
