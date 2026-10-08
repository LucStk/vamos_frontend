import 'package:dartz/dartz.dart';

import '../domain/slot.dart';
import 'base_mode_model.dart';
import 'mode_command.dart';
import 'mode_decorator.dart';

/// Résultat typé d'une commande. Remplace `NoResult` pour les commandes sans donnée.
final class Done {
  const Done();
}

final class PendingRun<M extends BaseMode<M>> {
  const PendingRun._(this.command, this.then);
  final ModeCommand<M, Object> command;
  final GestureResult<M>? Function(M current, Object result)? then;
}

typedef SlotChange = (Slot slot, Object? value);

final class GestureResult<M extends BaseMode<M>> {
  const GestureResult({
    this.mode,
    this.pending,
    this.decorator,
    this.slots = const [],
  });

  /// Ne change que le slot, pas le mode. `null` vide le slot.
  static GestureResult<M> set<M extends BaseMode<M>, T extends Object>(
    Slot<T> slot,
    T? value,
  ) => GestureResult<M>(slots: [(slot, value)]);

  /// Ajoute un changement de slot : `GestureResult.to(m).and(selection, x)`.
  GestureResult<M> and<T extends Object>(Slot<T> slot, T? value) =>
      GestureResult(
        mode: mode,
        pending: pending,
        decorator: decorator,
        slots: [...slots, (slot, value)],
      );

  final List<SlotChange> slots;

  const GestureResult.none() : this();
  const GestureResult.to(M mode) : this(mode: mode);
  const GestureResult.decorate(ModeDecorator<M> decorator)
    : this(decorator: decorator);

  final M? mode;
  final PendingRun<M>? pending;
  final ModeDecorator<M>? decorator;

  /// Lance un effet. `then` est appelé avec le mode COURANT à la fin de l'effet,
  /// et seulement s'il a réussi.
  // gesture_result.dart : `run` accepte un mode appliqué avant l'effet
  static GestureResult<M> run<M extends BaseMode<M>, R extends Object>(
    ModeCommand<M, R> command, {
    M? mode,
    GestureResult<M>? Function(M current, R result)? then,
  }) => GestureResult(
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
