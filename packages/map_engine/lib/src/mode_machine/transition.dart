import 'effect/pending_run.dart';
import 'mode.dart';
import 'mode_state.dart';
import 'overlay/overlay.dart';
import 'slot.dart';
import 'command/mode_command.dart';

// Les commandes importent `Done` depuis ici : on le réexporte.
export 'effect/results.dart';

part 'transition/resolved.dart';
part 'transition/deferred.dart';

/// Ce qu'un mode ou un intent renvoie :
/// - [ResolvedTransition] : décrite complètement ;
/// - [DeferredTransition] : construite avec le contexte et le mode courants.
sealed class Transition<M extends Mode<M>> {
  const Transition();
  ResolvedTransition<M>? resolve(ModeState<M> state);

  // --- Immédiates (renvoient ResolvedTransition : `.and` etc. dispo) -------

  static ResolvedTransition<M> stay<M extends Mode<M>>() =>
      ResolvedTransition<M>();

  static ResolvedTransition<M> to<M extends Mode<M>>(M mode) =>
      ResolvedTransition<M>(mode: mode);

  static ResolvedTransition<M> overlay<M extends Mode<M>>(Overlay<M> o) =>
      ResolvedTransition<M>(overlay: o);

  static ResolvedTransition<M> dismiss<M extends Mode<M>>() =>
      ResolvedTransition<M>(closesOverlay: true);

  /// Ne change que le slot. `null` le vide.
  static ResolvedTransition<M> set<M extends Mode<M>, T extends Object>(
    Slot<T> slot,
    T? value,
  ) => ResolvedTransition<M>(slots: [(slot, value)]);

  /// Lance un effet. `then` reçoit le mode COURANT à la fin, et seulement
  /// si l'effet a réussi.
  static ResolvedTransition<M> run<M extends Mode<M>, R extends Object>(
    ModeCommand<M, R> command, {
    M? mode,
    Transition<M>? Function(M current, R result)? then,
  }) =>
      ResolvedTransition<M>(mode: mode, pending: PendingRun.of(command, then));

  // --- Différées : `null` annule l'action ----------------------------------

  static DeferredTransition<M> withState<M extends Mode<M>>(
    Transition<M>? Function(ModeState<M> state) build,
  ) => DeferredTransition<M>(build);

  static DeferredTransition<M> withMode<M extends Mode<M>, S extends M>(
    Transition<M>? Function(S mode) build,
  ) => withState<M>((st) => st.mode is S ? build(st.mode as S) : null);

  static DeferredTransition<M> withSlot<M extends Mode<M>, T extends Object>(
    Slot<T> slot,
    Transition<M>? Function(T value) build,
  ) => withState<M>((st) {
    final v = st.slots.get(slot);
    return v == null ? null : build(v);
  });

  static DeferredTransition<M> update<M extends Mode<M>, T extends Object>(
    Slot<T> slot,
    T? Function(T current) change,
  ) => withSlot<M, T>(slot, (v) => set<M, T>(slot, change(v)));
}
