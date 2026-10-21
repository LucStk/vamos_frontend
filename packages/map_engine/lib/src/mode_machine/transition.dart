import 'package:map_engine/src/domain/objects/map_objects.dart';
import 'package:map_engine/src/mode_machine/command/command.dart';
import 'package:map_engine/src/mode_machine/command/effect/pending_run.dart';
import 'package:map_engine/src/mode_machine/mode.dart';
import 'package:map_engine/src/mode_machine/mode_state.dart';
import 'package:map_engine/src/mode_machine/overlay.dart';
import 'package:map_engine/src/mode_machine/slots/selection_slot.dart';
import 'package:map_engine/src/mode_machine/slots/slot.dart';

// Les commandes importent `Done` depuis ici : on le réexporte.

part 'transition/resolved.dart';
part 'transition/deferred.dart';

/// Ce qu'un mode ou un intent renvoie :
/// - [ResolvedTransition] : décrite complètement ;
/// - [DeferredTransition] : construite avec le contexte et le mode courants.
// transition.dart
sealed class Transition<M extends Mode<M>> {
  const Transition();
  ResolvedTransition<M>? resolve(ModeState<M> state);

  /// Applique [f] au résultat, quand il sera connu.
  Transition<M> _map(ResolvedTransition<M> Function(ResolvedTransition<M>) f);

  Transition<M> and<T extends Object>(Slot<T> slot, T? value) =>
      _map((r) => r.and(slot, value));
  Transition<M> withOverlay(Overlay<M> o) => _map((r) => r.withOverlay(o));
  Transition<M> closingOverlay() => _map((r) => r.closingOverlay());

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
    Command<R, Object?> command, {
    Transition<M>? Function(ModeState<M> current, R result)? then,
  }) => ResolvedTransition<M>(pending: PendingRun.of(command, then));

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
  static DeferredTransition<M>
  withSelection<M extends Mode<M>, T extends Selectable>(
    Transition<M>? Function(T value) build,
  ) => withSlot<M, Selectable>(selectionSlot, (st) {
    return (st is T) ? build(st) : null;
  });

  static DeferredTransition<M> update<M extends Mode<M>, T extends Object>(
    Slot<T> slot,
    T? Function(T current) change,
  ) => withSlot<M, T>(slot, (v) => set<M, T>(slot, change(v)));
}
