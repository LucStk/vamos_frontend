import 'package:map_engine/src/gesture_engine/hit_test.dart';
import 'package:map_engine/src/gesture_engine/map_gesture.dart';
import 'package:map_engine/src/mode_engine/effect/effect.dart';
import 'package:map_engine/src/mode_engine/mode.dart';
import 'package:map_engine/src/mode_engine/mode_state.dart';
import 'package:map_engine/src/mode_engine/overlay.dart';
import 'package:map_engine/src/mode_engine/transition.dart';

mixin ModeMachine implements GestureSink {
  void setState(ModeState state);
  Mode get mode => state.mode;
  ModeState get state;

  HandlerRegistry get registry;
  EffectQueue get effectQueue;

  void schedule(PendingRun run) {
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

  void apply(Transition? transition) {
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

  void _commit(ModeState next) {
    if (!identical(next, state)) setState(next);
  }
}
