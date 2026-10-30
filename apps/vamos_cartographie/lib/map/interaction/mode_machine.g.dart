// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mode_machine.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AppModeMachine)
final appModeMachineProvider = AppModeMachineProvider._();

final class AppModeMachineProvider
    extends $NotifierProvider<AppModeMachine, ModeState> {
  AppModeMachineProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appModeMachineProvider',
        isAutoDispose: false,
        dependencies: <ProviderOrFamily>[],
        $allTransitiveDependencies: <ProviderOrFamily>[],
      );

  @override
  String debugGetCreateSourceHash() => _$appModeMachineHash();

  @$internal
  @override
  AppModeMachine create() => AppModeMachine();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ModeState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ModeState>(value),
    );
  }
}

String _$appModeMachineHash() => r'37658771facf780c4c47f8c256a7cc35747c14ff';

abstract class _$AppModeMachine extends $Notifier<ModeState> {
  ModeState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<ModeState, ModeState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ModeState, ModeState>,
              ModeState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

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
        dependencies: <ProviderOrFamily>[appModeMachineProvider],
        $allTransitiveDependencies: <ProviderOrFamily>[
          MapModeProvider.$allTransitiveDependencies0,
        ],
      );

  static final $allTransitiveDependencies0 = appModeMachineProvider;

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

String _$mapModeHash() => r'096ca24bff3b8d87cc07220b75bb04c1393df29f';

@ProviderFor(modeOverlay)
final modeOverlayProvider = ModeOverlayProvider._();

final class ModeOverlayProvider
    extends $FunctionalProvider<Overlay?, Overlay?, Overlay?>
    with $Provider<Overlay?> {
  ModeOverlayProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'modeOverlayProvider',
        isAutoDispose: false,
        dependencies: <ProviderOrFamily>[appModeMachineProvider],
        $allTransitiveDependencies: <ProviderOrFamily>[
          ModeOverlayProvider.$allTransitiveDependencies0,
        ],
      );

  static final $allTransitiveDependencies0 = appModeMachineProvider;

  @override
  String debugGetCreateSourceHash() => _$modeOverlayHash();

  @$internal
  @override
  $ProviderElement<Overlay?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Overlay? create(Ref ref) {
    return modeOverlay(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Overlay? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Overlay?>(value),
    );
  }
}

String _$modeOverlayHash() => r'9501391ad9a585018ca12ba3108f32d7a9447b1d';

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
        dependencies: <ProviderOrFamily>[appModeMachineProvider],
        $allTransitiveDependencies: <ProviderOrFamily>[
          ModeSelectionProvider.$allTransitiveDependencies0,
        ],
      );

  static final $allTransitiveDependencies0 = appModeMachineProvider;

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

String _$modeSelectionHash() => r'19b12d1305965e77fee8f1d2528f39fa077c083e';

@ProviderFor(modeSlot)
final modeSlotProvider = ModeSlotFamily._();

final class ModeSlotProvider<T extends Object>
    extends $FunctionalProvider<T?, T?, T?>
    with $Provider<T?> {
  ModeSlotProvider._({
    required ModeSlotFamily super.from,
    required Slot<T> super.argument,
  }) : super(
         retry: null,
         name: r'modeSlotProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  static final $allTransitiveDependencies0 = appModeMachineProvider;

  @override
  String debugGetCreateSourceHash() => _$modeSlotHash();

  @override
  String toString() {
    return r'modeSlotProvider'
        '<${T}>'
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<T?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  T? create(Ref ref) {
    final argument = this.argument as Slot<T>;
    return modeSlot<T>(ref, argument);
  }

  $R _captureGenerics<$R>($R Function<T extends Object>() cb) {
    return cb<T>();
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(T? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<T?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ModeSlotProvider &&
        other.runtimeType == runtimeType &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, argument);
  }
}

String _$modeSlotHash() => r'9049089248d442bbdb15ee2531d0893a66c2d3da';

final class ModeSlotFamily extends $Family {
  ModeSlotFamily._()
    : super(
        retry: null,
        name: r'modeSlotProvider',
        dependencies: <ProviderOrFamily>[appModeMachineProvider],
        $allTransitiveDependencies: <ProviderOrFamily>[
          ModeSlotProvider.$allTransitiveDependencies0,
        ],
        isAutoDispose: false,
      );

  ModeSlotProvider<T> call<T extends Object>(Slot<T> slot) =>
      ModeSlotProvider<T>._(argument: slot, from: this);

  @override
  String toString() => r'modeSlotProvider';

  /// {@macro riverpod.override_with}
  Override overrideWith(
    T? Function<T extends Object>(Ref ref, Slot<T> args) create,
  ) => $FamilyOverride(
    from: this,
    createElement: (pointer) {
      final provider = pointer.origin as ModeSlotProvider;
      return provider._captureGenerics(<T extends Object>() {
        provider as ModeSlotProvider<T>;
        final argument = provider.argument as Slot<T>;
        return provider
            .$view(create: (ref) => create(ref, argument))
            .$createElement(pointer);
      });
    },
  );
}
