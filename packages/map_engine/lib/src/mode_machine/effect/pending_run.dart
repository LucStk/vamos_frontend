import '../command/mode_command.dart';
import '../mode.dart';
import '../mode_state.dart';
import '../transition.dart';

final class PendingRun<M extends Mode<M>> {
  const PendingRun._(this.command, this.then);

  static PendingRun<M> of<M extends Mode<M>, R extends Object>(
    ModeCommand<M, R> command,
    Transition<M>? Function(ModeState<M> current, R result)? then,
  ) => PendingRun._(command, then == null ? null : (m, r) => then(m, r as R));

  final ModeCommand<M, Object> command;
  final Transition<M>? Function(ModeState<M> current, Object result)? then;
}
