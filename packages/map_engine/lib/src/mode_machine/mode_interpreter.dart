import '../domain/gestures/gesture_sink.dart';
import '../domain/gestures/map_gesture.dart';
import 'command/mode_command.dart';
import 'effect/pending_run.dart';
import 'mode.dart';
import 'effect_queue.dart';
import 'transition.dart';
import 'overlay/overlay.dart';
import 'mode_state.dart';

mixin ModeInterpreter<M extends Mode<M>> implements ModeHost {
  ModeState<M> get state;
  void setState(ModeState<M> state);
  M get mode => state.mode;

  ModeCommandResolver<M> get resolver;
  EffectQueue get effectQueue;

  @override
  void send(MapGesture event) {
    final interception = state.overlay?.intercept(event) ?? Interception.pass;
    if (interception.dismisses) dismissOverlay();
    if (interception.consumes) return;
    apply(mode.dispatchGesture(event));
  }

  @override
  void dismissOverlay() => _commit(state.withoutOverlay());

  void apply(Transition<M>? transition) {
    final t = transition?.resolve(state);
    if (t == null) return;
    _commit(state.after(t));
    final pending = t.pending;
    if (pending != null) effectQueue.add(() => _run(pending));
  }

  void _commit(ModeState<M> next) {
    if (!identical(next, state)) setState(next);
  }

  Future<void> _run(PendingRun<M> pending) async {
    final result = await resolver.resolve(pending.command);
    if (result == null) return;
    // `mode` est lu après l'attente : c'est le mode COURANT.
    apply(pending.then?.call(state, result));
  }
}
