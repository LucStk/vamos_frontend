import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/map/interaction/mode_scope.dart';

part 'mode_machine.g.dart';

@Dependencies([modeSelection, ModeMachine])
extension ModeApply on WidgetRef {
  void applyTransition(Transition? t) =>
      read(appModeMachineProvider.notifier).apply(t);
}

@Riverpod(keepAlive: true)
class AppModeMachine extends _$AppModeMachine with ModeMachine {
  @override
  ModeState build() => ModeState(mode: ExploreMode());

  @override
  void setState(ModeState next) {
    if (ref.mounted) state = next;
  }

  final _queue = EffectQueue();

  @override
  EffectQueue get effectQueue => _queue;

  @override
  HandlerRegistry get registry => ref.read(handlerRegistryProvider);
}

// Dérivés : ils ne dépendent plus que de l'état
@Riverpod(keepAlive: true, dependencies: [AppModeMachine])
AppMode mapMode(Ref ref) =>
    ref.watch(appModeMachineProvider.select((s) => (s.mode as AppMode)));

@Riverpod(keepAlive: true, dependencies: [AppModeMachine])
Overlay? modeOverlay(Ref ref) =>
    ref.watch(appModeMachineProvider.select((s) => s.overlay));

@Riverpod(keepAlive: true, dependencies: [AppModeMachine, modeSlot])
Selectable? modeSelection(Ref ref) =>
    ref.watch(modeSlotProvider(selectionSlot));

@Riverpod(keepAlive: true, dependencies: [AppModeMachine])
T? modeSlot<T extends Object>(Ref ref, Slot<T> slot) =>
    ref.watch(appModeMachineProvider.select((s) => s.slots.get<T>(slot)));
