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

String _$modeStateNotifierHash() => r'8d24b8373e428892192f73137cd7958384a90802';

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
        dependencies: <ProviderOrFamily>[handlerRegistryProvider],
        $allTransitiveDependencies: <ProviderOrFamily>[
          ModeMachineProvider.$allTransitiveDependencies0,
          ModeMachineProvider.$allTransitiveDependencies1,
        ],
      );

  static final $allTransitiveDependencies0 = handlerRegistryProvider;
  static final $allTransitiveDependencies1 =
      HandlerRegistryProvider.$allTransitiveDependencies0;

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

String _$modeMachineHash() => r'453119fde5a87ff4cbdbf3b67e7805578f71c1f1';

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
