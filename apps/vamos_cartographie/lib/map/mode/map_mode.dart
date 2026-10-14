import 'package:map_engine/map_engine.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/map/mode/mode_machine.dart';
part 'map_mode.g.dart';

@Riverpod(keepAlive: true)
class ModeStateNotifier extends _$ModeStateNotifier {
  @override
  AppModeState build() => ModeState<AppMode>(ExploreMode());

  void set(AppModeState next) => state = next;
}

@Riverpod(keepAlive: true, dependencies: [])
AppModeMachine modeMachine(Ref ref) => AppModeMachine(ref);

// Dérivés : ils ne dépendent plus que de l'état
@Riverpod(keepAlive: true, dependencies: [])
AppMode mapMode(Ref ref) => ref.watch(modeStateProvider.select((s) => s.mode));

@Riverpod(keepAlive: true, dependencies: [])
AppOverlay? modeOverlay(Ref ref) =>
    ref.watch(modeStateProvider.select((s) => s.overlay));

@Riverpod(keepAlive: true, dependencies: [])
Selectable? modeSelection(Ref ref) =>
    ref.watch(modeStateProvider.select((s) => s.slots.get(selectionSlot)));

@Riverpod(keepAlive: true, dependencies: [modeMachine])
ModeHost mapModeController(Ref ref) => ref.watch(modeMachineProvider);
