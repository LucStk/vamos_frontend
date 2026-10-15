import 'package:map_engine/src/domain/gestures/gesture_sink.dart';
import 'package:map_engine/src/domain/gestures/map_gesture.dart';
import 'package:map_engine/src/mode_machine/effect/effect_runner.dart';
import 'package:map_engine/src/mode_machine/effect/handler_registry.dart';
import 'package:map_engine/src/mode_machine/effect/effect_queue.dart';
import 'package:map_engine/src/mode_machine/effect/pending_run.dart';
import 'package:map_engine/src/mode_machine/mode.dart';
import 'package:map_engine/src/mode_machine/mode_state.dart';
import 'package:map_engine/src/mode_machine/overlay/overlay.dart';
import 'package:map_engine/src/mode_machine/transition.dart';

// mode_interpreter.dart
mixin ModeMachine<M extends Mode<M>> implements ModeHost, ModeDriver<M> {
  void setState(ModeState<M> state);
  M get mode => state.mode;

  HandlerRegistry get registry;
  EffectQueue get effectQueue;

  late final EffectRunner<M> _runner = EffectRunner(
    registry: registry,
    queue: effectQueue,
    driver: this,
  );

  void schedule(PendingRun<M> run) => _runner.schedule(run);
  // setState, apply, send, dismissOverlay... inchangés

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
