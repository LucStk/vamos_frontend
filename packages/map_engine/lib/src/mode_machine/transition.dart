import 'package:dartz/dartz.dart';

import 'command/mode_command.dart';
import 'mode.dart';
import 'mode_context.dart';
import 'overlay/overlay.dart';
import 'slot.dart';

/// Résultat typé d'une commande. Remplace `NoResult` pour les commandes sans donnée.
final class Done {
  const Done();
}

final class PendingRun<M extends Mode<M>> {
  const PendingRun._(this.command, this.then);
  final ModeCommand<M, Object> command;
  final Transition<M>? Function(M current, Object result)? then;
}

typedef SlotChange = (Slot slot, Object? value);

/// Ce qu'un mode ou un intent renvoie. Deux formes possibles :
/// - [ResolvedTransition] : décrite complètement, applicable telle quelle ;
/// - [DeferredTransition] : construite par l'interpréteur avec le contexte courant.
sealed class Transition<M extends Mode<M>> {
  const Transition();

  // --- Fabriques : toutes renvoient ResolvedTransition (donc `.and` dispo) --

  static ResolvedTransition<M> stay<M extends Mode<M>>() =>
      ResolvedTransition<M>();

  static ResolvedTransition<M> to<M extends Mode<M>>(M mode) =>
      ResolvedTransition<M>(mode: mode);

  static ResolvedTransition<M> overlay<M extends Mode<M>>(Overlay<M> overlay) =>
      ResolvedTransition<M>(overlay: overlay);

  /// Ne change que le slot, pas le mode. `null` vide le slot.
  static ResolvedTransition<M> set<M extends Mode<M>, T extends Object>(
    Slot<T> slot,
    T? value,
  ) => ResolvedTransition<M>(slots: [(slot, value)]);

  /// Lance un effet. `then` est appelé avec le mode COURANT à la fin de l'effet,
  /// et seulement s'il a réussi.
  static ResolvedTransition<M> run<M extends Mode<M>, R extends Object>(
    ModeCommand<M, R> command, {
    M? mode,
    Transition<M>? Function(M current, R result)? then,
  }) => ResolvedTransition<M>(
    mode: mode,
    pending: PendingRun._(
      command,
      then == null ? null : (m, r) => then(m, r as R),
    ),
  );

  // --- Fabriques différées -------------------------------------------------

  /// Construit la transition à partir du contexte courant.
  /// Renvoyer `null` annule l'action.
  static DeferredTransition<M> withContext<M extends Mode<M>>(
    Transition<M>? Function(ModeContext ctx) build,
  ) => DeferredTransition<M>(build);

  /// Comme [withContext], mais lit un slot. Slot vide : rien ne se passe.
  static DeferredTransition<M> withSlot<M extends Mode<M>, T extends Object>(
    Slot<T> slot,
    Transition<M>? Function(T value) build,
  ) => DeferredTransition<M>((ctx) {
    final value = ctx.get(slot);
    return value == null ? null : build(value);
  });
}

final class ResolvedTransition<M extends Mode<M>> extends Transition<M> {
  const ResolvedTransition({
    this.mode,
    this.pending,
    this.overlay,
    this.slots = const [],
  });

  final M? mode;
  final PendingRun<M>? pending;
  final Overlay<M>? overlay;
  final List<SlotChange> slots;

  /// Ajoute un changement de slot : `Transition.to(m).and(selection, x)`.
  /// N'existe que sur ce type : impossible de l'appeler sur une différée.
  ResolvedTransition<M> and<T extends Object>(Slot<T> slot, T? value) =>
      ResolvedTransition(
        mode: mode,
        pending: pending,
        overlay: overlay,
        slots: [...slots, (slot, value)],
      );
}

final class DeferredTransition<M extends Mode<M>> extends Transition<M> {
  const DeferredTransition(this.build);
  final Transition<M>? Function(ModeContext ctx) build;
}

/// Exécute un effet sans donnée de retour.
Future<Done> done(Future<void> Function() effect) async {
  await effect();
  return const Done();
}

/// Exécute un effet qui peut échouer. `null` = échec, donc `then` n'est pas appelé.
Future<R?> valueOrNull<R extends Object, F>(
  Future<Either<F, R>> effect,
) async => (await effect).fold((_) => null, (value) => value);
