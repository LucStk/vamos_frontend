import '../domain/gestures/gesture_sink.dart';
import '../domain/gestures/map_gesture.dart';
import '../domain/space/offset_type.dart';
import 'base_mode_model.dart';
import 'effect_queue.dart';
import 'gesture_result.dart';
import 'mode_command.dart';
import 'mode_decorator.dart';
import 'mode_state.dart';

mixin ModeControllerMixin<M extends BaseMode<M>> implements GestureSink {
  ModeState<M> get state;
  void setState(ModeState<M> state);
  M get mode => state.mode;

  ModeCommandResolver<M> get resolver;
  EffectQueue get effectQueue;

  @override
  void send(MapGesture event, ScreenOffset offset) {
    final interception =
        state.decorator?.intercept(event, offset) ?? Interception.pass;

    if (interception.dismisses) dismissDecorator();
    if (interception.consumes) return;

    apply(mode.dispatchGesture(event, offset));
  }

  void dismissDecorator() {
    if (state.decorator != null) setState(ModeState(mode));
  }

  /// Exécute l'intent seulement si le mode courant est bien du type T.
  void act<T extends M>(GestureResult<M>? Function(T mode) intent) {
    final current = mode;
    if (current is T) apply(intent(current));
  }

  void apply(GestureResult<M>? result, {bool fromEffect = false}) {
    if (result == null) return;

    final current = state.decorator;
    final keep = current != null && (fromEffect || current.survives(result));
    final nextDecorator = result.decorator ?? (keep ? current : null);
    final nextMode = result.mode ?? mode;

    if (!identical(nextMode, mode) || !identical(nextDecorator, current)) {
      setState(ModeState(nextMode, nextDecorator));
    }

    final pending = result.pending;
    if (pending != null) effectQueue.add(() => _run(pending));
  }

  Future<void> _run(PendingRun<M> pending) async {
    final result = await resolver.resolve(pending.command);
    if (result == null) return;
    // Un effet qui se termine ne ferme pas un décorateur ouvert entre-temps.
    apply(pending.then?.call(mode, result), fromEffect: true);
  }
}
