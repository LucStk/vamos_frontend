import 'package:map_engine/src/domain/gestures/gesture_sink.dart';
import 'package:map_engine/src/domain/gestures/map_gesture.dart';
import 'package:map_engine/src/mode_machine/command/effect/effect_queue.dart';
import 'package:map_engine/src/mode_machine/command/effect/handler_registry.dart';
import 'package:map_engine/src/mode_machine/command/effect/pending_run.dart';
import 'package:map_engine/src/mode_machine/mode.dart';
import 'package:map_engine/src/mode_machine/mode_state.dart';
import 'package:map_engine/src/mode_machine/overlay.dart';
import 'package:map_engine/src/mode_machine/transition.dart';

mixin ModeMachine<M extends Mode<M>> implements ModeHost {
  void setState(ModeState<M> state);
  M get mode => state.mode;
  ModeState<M> get state;

  HandlerRegistry get registry;
  EffectQueue get effectQueue;

  void schedule(PendingRun<M> run) {
    final reg = registry; // lu ici, donc après le _commit de apply()
    effectQueue.add(() async {
      try {
        apply(await run.execute(reg, () => state));
      } catch (e, st) {
        print('effet en échec : $e\n$st');
        rethrow;
      }
    });
  }

  void apply(Transition<M>? transition) {
    final t = transition?.resolve(state);
    if (t == null) return;
    _commit(state.after(t));
    final pending = t.pending;
    if (pending != null) schedule(pending);
  }

  @override
  void send(MapGesture event) {
    final overlay = state.overlay;
    final interception = overlay?.intercept(event) ?? Interception.pass;

    if (interception.dismisses) {
      dismissOverlay();
    } else if (overlay != null) {
      final visible = overlay.visibleAfter(event);
      if (visible != null) _commit(state.withOverlayVisible(visible));
    }

    if (interception.consumes) return;
    apply(mode.dispatchGesture(event));
  }

  @override
  void dismissOverlay() => _commit(state.withoutOverlay());

  void _commit(ModeState<M> next) {
    if (!identical(next, state)) setState(next);
  }
}
