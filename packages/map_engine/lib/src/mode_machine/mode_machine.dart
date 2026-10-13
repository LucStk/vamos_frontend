import '../domain/gestures/gesture_sink.dart';
import '../domain/gestures/map_gesture.dart';
import 'effect/effect_runner.dart';
import 'effect/pending_run.dart';
import 'mode.dart';
import 'transition.dart';
import 'overlay/overlay.dart';
import 'mode_state.dart';

// mode_interpreter.dart
mixin ModeMachine<M extends Mode<M>> implements ModeHost, ModeDriver<M> {
  void setState(ModeState<M> state);
  M get mode => state.mode;

  /// Appelé quand une transition demande un effet. L'interpréteur ne l'exécute pas.
  void schedule(PendingRun<M> run);

  @override
  void apply(Transition<M>? transition) {
    final t = transition?.resolve(state);
    if (t == null) return;
    _commit(state.after(t));
    final pending = t.pending;
    if (pending != null) schedule(pending);
  }

  @override
  void send(MapGesture event) {
    final interception = state.overlay?.intercept(event) ?? Interception.pass;
    if (interception.dismisses) dismissOverlay();
    if (interception.consumes) return;
    apply(mode.dispatchGesture(event));
  }

  @override
  void dismissOverlay() => _commit(state.withoutOverlay());

  void _commit(ModeState<M> next) {
    if (!identical(next, state)) setState(next);
  }
}
