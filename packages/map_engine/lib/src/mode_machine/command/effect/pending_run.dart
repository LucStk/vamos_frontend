import 'package:map_engine/src/mode_machine/command/command.dart';
import 'package:map_engine/src/mode_machine/command/effect/handler_registry.dart';
import 'package:map_engine/src/mode_machine/mode.dart';
import 'package:map_engine/src/mode_machine/mode_state.dart';
import 'package:map_engine/src/mode_machine/transition.dart';

final class PendingRun<M extends Mode<M>> {
  const PendingRun._(this._execute);

  static PendingRun<M> of<M extends Mode<M>, R extends Object>(
    Command<R> command,
    Transition<M>? Function(ModeState<M> current, R result)? then,
  ) => PendingRun._((registry, current) async {
    final result = await command.run(registry);
    if (result == null) return null;
    // `current()` est appelé après l'attente : c'est le mode COURANT.
    return then?.call(current(), result);
  });

  final Future<Transition<M>?> Function(
    HandlerRegistry registry,
    ModeState<M> Function() current,
  )
  _execute;

  Future<Transition<M>?> execute(
    HandlerRegistry registry,
    ModeState<M> Function() current,
  ) => _execute(registry, current);
}
