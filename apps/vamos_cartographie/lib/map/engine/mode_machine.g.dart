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
        dependencies: null,
        $allTransitiveDependencies: null,
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

String _$appModeMachineHash() => r'53cdb833623495b420ac22eef7f95255762b4878';

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
        dependencies: null,
        $allTransitiveDependencies: null,
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

String _$mapModeHash() => r'e47f019c12fae950257529516e7d59fedb275342';

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
        dependencies: null,
        $allTransitiveDependencies: null,
      );

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

String _$modeOverlayHash() => r'2a663e7e939836bf24171872c0bf2e75ea7fb808';

@ProviderFor(modeSelection)
final modeSelectionProvider = ModeSelectionProvider._();

final class ModeSelectionProvider
    extends $FunctionalProvider<MapObject?, MapObject?, MapObject?>
    with $Provider<MapObject?> {
  ModeSelectionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'modeSelectionProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$modeSelectionHash();

  @$internal
  @override
  $ProviderElement<MapObject?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MapObject? create(Ref ref) {
    return modeSelection(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MapObject? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MapObject?>(value),
    );
  }
}

String _$modeSelectionHash() => r'ac152fb39712ccfb7f77412239be9746609afe5a';

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

String _$modeSlotHash() => r'69213efec29b24d8f3deb9097eea4a3f51b7cfb9';

final class ModeSlotFamily extends $Family {
  ModeSlotFamily._()
    : super(
        retry: null,
        name: r'modeSlotProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
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
