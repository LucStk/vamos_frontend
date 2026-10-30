import 'package:map_engine/src/mode_engine/command.dart';
import 'package:map_engine/src/mode_engine/effect/handler_registry.dart';
import 'package:map_engine/src/mode_engine/mode_state.dart';
import 'package:map_engine/src/mode_engine/transition.dart';

final class PendingRun {
  const PendingRun._(this._execute);

  static PendingRun of<R extends Object>(
    Command<R> command,
    Transition? Function(ModeState current, R result)? then,
  ) => PendingRun._((registry, current) async {
    final result = await command.run(registry);
    if (result == null) return null;
    // `current()` est appelé après l'attente : c'est le mode COURANT.
    return then?.call(current(), result);
  });

  final Future<Transition?> Function(
    HandlerRegistry registry,
    ModeState Function() current,
  )
  _execute;

  Future<Transition?> execute(
    HandlerRegistry registry,
    ModeState Function() current,
  ) => _execute(registry, current);
}
