import '../domain/gestures/gesture_sink.dart';
import '../domain/gestures/map_gesture.dart';
import '../domain/space/offset_type.dart';
import 'base_mode_model.dart';
import 'effect_queue.dart';
import 'gesture_result.dart';
import 'mode_command.dart';

mixin ModeControllerMixin<M extends BaseMode<M>> implements GestureSink {
  M get mode;

  void setMode(M mode);

  ModeCommandResolver<M> get resolver;

  EffectQueue get effectQueue;

  void send(MapGesture event, ScreenOffset offset) {
    apply(mode.dispatchGesture(event, offset));
  }

  /// Exécute l'intent seulement si le mode courant est bien du type T.
  void act<T extends M>(GestureResult<M>? Function(T mode) intent) {
    final current = mode;
    if (current is T) apply(intent(current));
  }

  void apply(GestureResult<M>? result) {
    if (result == null) return;

    final next = result.mode;
    if (next != null) {
      setMode(next);
    }

    final pending = result.pending;
    if (pending != null) {
      effectQueue.add(() => _run(pending));
    }
  }

  Future<void> _run(PendingRun<M> pending) async {
    final result = await resolver.resolve(pending.command);

    if (result == null) return;

    apply(pending.then?.call(mode, result));
  }
}
