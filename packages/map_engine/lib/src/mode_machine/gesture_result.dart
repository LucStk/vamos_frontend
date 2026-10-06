import 'base_mode_model.dart';
import 'mode_command.dart';

/// Résultat typé d'une commande. Remplace `NoResult` pour les commandes sans donnée.
final class Done {
  const Done();
}

final class PendingRun<M extends BaseMode<M>> {
  const PendingRun._(this.command, this.then);
  final ModeCommand<M, Object> command;
  final GestureResult<M>? Function(M current, Object result)? then;
}

final class GestureResult<M extends BaseMode<M>> {
  const GestureResult({this.mode, this.pending});
  const GestureResult.none() : this();
  const GestureResult.to(M mode) : this(mode: mode);

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

  final M? mode;
  final PendingRun<M>? pending;
}

/// Exécute un effet sans donnée de retour.
Future<Done> done(Future<void> Function() effect) async {
  await effect();
  return const Done();
}
