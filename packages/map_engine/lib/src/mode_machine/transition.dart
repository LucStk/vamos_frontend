import 'package:dartz/dartz.dart';

import 'slot.dart';
import 'mode.dart';
import 'mode_command.dart';
import 'overlay/overlay.dart';

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

final class Transition<M extends Mode<M>> {
  const Transition({
    this.mode,
    this.pending,
    this.overlay,
    this.slots = const [],
  });

  /// Ne change que le slot, pas le mode. `null` vide le slot.
  static Transition<M> set<M extends Mode<M>, T extends Object>(
    Slot<T> slot,
    T? value,
  ) => Transition<M>(slots: [(slot, value)]);

  /// Ajoute un changement de slot : `Transition.to(m).and(selection, x)`.
  Transition<M> and<T extends Object>(Slot<T> slot, T? value) => Transition(
    mode: mode,
    pending: pending,
    overlay: overlay,
    slots: [...slots, (slot, value)],
  );

  final List<SlotChange> slots;

  const Transition.stay() : this();
  const Transition.to(M mode) : this(mode: mode);
  const Transition.overlay(Overlay<M> overlay) : this(overlay: overlay);

  final M? mode;
  final PendingRun<M>? pending;
  final Overlay<M>? overlay;

  /// Lance un effet. `then` est appelé avec le mode COURANT à la fin de l'effet,
  /// et seulement s'il a réussi.
  // transition.dart : `run` accepte un mode appliqué avant l'effet
  static Transition<M> run<M extends Mode<M>, R extends Object>(
    ModeCommand<M, R> command, {
    M? mode,
    Transition<M>? Function(M current, R result)? then,
  }) => Transition(
    mode: mode,
    pending: PendingRun._(
      command,
      then == null ? null : (m, r) => then(m, r as R),
    ),
  );
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
