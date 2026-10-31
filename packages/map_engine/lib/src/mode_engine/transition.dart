import 'package:map_engine/src/mode_engine/command.dart';
import 'package:map_engine/src/mode_engine/effect/effect.dart';
import 'package:map_engine/src/mode_engine/mode.dart';
import 'package:map_engine/src/mode_engine/mode_state.dart';
import 'package:map_engine/src/mode_engine/overlay.dart';
import 'package:map_engine/src/mode_engine/slots.dart';

// Les commandes importent `Done` depuis ici : on le réexporte.

part 'transition/resolved.dart';
part 'transition/deferred.dart';

/// Ce qu'un mode ou un intent renvoie :
/// - [ResolvedTransition] : décrite complètement ;
/// - [DeferredTransition] : construite avec le contexte et le mode courants.
// transition.dart
sealed class Transition {
  const Transition();
  ResolvedTransition? resolve(ModeState state);

  /// Applique [f] au résultat, quand il sera connu.
  Transition _map(ResolvedTransition Function(ResolvedTransition) f);

  Transition and<T extends Object>(Slot<T> slot, T? value) =>
      _map((r) => r.and(slot, value));
  Transition withOverlay(Overlay o) => _map((r) => r.withOverlay(o));
  Transition closingOverlay() => _map((r) => r.closingOverlay());

  // --- Immédiates (renvoient ResolvedTransition : `.and` etc. dispo) -------

  static ResolvedTransition stay() => ResolvedTransition();

  static ResolvedTransition to(Mode mode) => ResolvedTransition(mode: mode);

  static ResolvedTransition overlay(Overlay o) =>
      ResolvedTransition(overlay: o);

  static ResolvedTransition dismiss() =>
      ResolvedTransition(closesOverlay: true);

  /// Ne change que le slot. `null` le vide.
  static ResolvedTransition set<T extends Object>(Slot<T> slot, T? value) =>
      ResolvedTransition(slots: [(slot, value)]);

  /// Lance un effet. `then` reçoit le mode COURANT à la fin, et seulement
  /// si l'effet a réussi.
  static ResolvedTransition run<R extends Object>(
    Command<R> command, {
    Transition? Function(ModeState current, R result)? then,
  }) => ResolvedTransition(pending: PendingRun.of(command, then));

  // --- Différées : `null` annule l'action ----------------------------------

  static DeferredTransition withState(
    Transition? Function(ModeState state) build,
  ) => DeferredTransition(build);

  static DeferredTransition withMode<S extends Mode>(
    Transition? Function(S mode) build,
  ) => withState((st) => st.mode is S ? build(st.mode as S) : null);

  static DeferredTransition withSlot<T extends Object>(
    Slot<T> slot,
    Transition? Function(T value) build,
  ) => withState((st) {
    final v = st.slots.get(slot);
    return v == null ? null : build(v);
  });

  // (si `section` est un RouteElements : HitObject<RouteElements> directement.)
  static DeferredTransition update<T extends Object>(
    Slot<T> slot,
    T? Function(T current) change,
  ) => withSlot<T>(slot, (v) => set<T>(slot, change(v)));
  // transition.dart, à côté de `run`
  /// Change de mode ET lance un effet, en une seule transition.
  /// Le mode est posé avant que l'effet ne parte : pas de fenêtre entre les deux.
  static ResolvedTransition toAndRun<R extends Object>(
    Mode mode,
    Command<R> command, {
    Transition? Function(ModeState current, R result)? then,
  }) => ResolvedTransition(mode: mode, pending: PendingRun.of(command, then));
}
