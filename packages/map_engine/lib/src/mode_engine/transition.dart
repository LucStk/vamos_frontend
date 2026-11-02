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
///
/// Les combinateurs d'instance (`and`, `withOverlay`, `closingOverlay`,
/// `switchingTo`, `running`) décrivent un ENREGISTREMENT de champs, pas une
/// séquence : `.running(c).switchingTo(m)` et `.switchingTo(m).running(c)`
/// sont équivalents (le mode est toujours posé avant l'effet).
sealed class Transition {
  const Transition();

  ResolvedTransition? resolve(ModeState state);

  /// Applique [f] au résultat, quand il sera connu.
  Transition _map(ResolvedTransition Function(ResolvedTransition) f);

  // --- Combinateurs (chaînables sur Resolved ET Deferred) ------------------

  /// Ajoute un changement de slot. `null` vide le slot.
  Transition and<T extends Object>(Slot<T> slot, T? value) =>
      _map((r) => r.and(slot, value));

  Transition clearSlot<T extends Object>(Slot<T> slot) =>
      _map((r) => r.clearSlot(slot));

  /// Ouvre / remplace l'overlay.
  Transition withOverlay(Overlay o) => _map((r) => r.withOverlay(o));

  /// Ferme explicitement l'overlay.
  Transition closingOverlay() => _map((r) => r.closingOverlay());

  /// Change de mode. Dernier appel gagnant.
  Transition switchingTo(Mode mode) => _map((r) => r.switchingTo(mode));

  /// Lance un effet. `then` reçoit le mode COURANT à la fin, et seulement
  /// si l'effet a réussi. Un seul effet par transition : pour enchaîner,
  /// utiliser `then`.
  Transition running<R extends Object>(
    Command<R> command, {
    Transition? Function(ModeState current, R result)? then,
  }) => _map((r) => r.running(command, then: then));

  // --- Immédiates (renvoient ResolvedTransition : les combinateurs sont
  //     disponibles avec leur type de retour précis) -----------------------

  static ResolvedTransition stay() => const ResolvedTransition();

  static ResolvedTransition to(Mode mode) => ResolvedTransition(mode: mode);

  static ResolvedTransition overlay(Overlay o) =>
      ResolvedTransition(overlay: o);

  static ResolvedTransition dismiss() =>
      const ResolvedTransition(closesOverlay: true);

  /// Ne change que le slot. `null` le vide.
  static ResolvedTransition set<T extends Object>(Slot<T> slot, T? value) =>
      ResolvedTransition(slots: [(slot, value)]);

  /// Lance un effet sans changer de mode.
  static ResolvedTransition run<R extends Object>(
    Command<R> command, {
    Transition? Function(ModeState current, R result)? then,
  }) => const ResolvedTransition().running(command, then: then);

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

  static DeferredTransition update<T extends Object>(
    Slot<T> slot,
    T? Function(T current) change,
  ) => withSlot<T>(slot, (v) => set<T>(slot, change(v)));
}
