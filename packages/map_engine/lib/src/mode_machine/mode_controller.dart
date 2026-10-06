import '../domain/gestures/map_gesture.dart';
import '../domain/space/offset_type.dart';
import 'base_mode_model.dart';
import 'effect_queue.dart';
import 'gesture_result.dart';
import 'mode_command.dart';

mixin ModeControllerMixin<M extends BaseMode<M>> {
  M get mode;

  void setMode(M mode);

  ModeCommandResolver<M> get resolver;

  EffectQueue get effectQueue;

  void send(MapGesture event, ScreenOffset offset) {
    apply(mode.dispatchGesture(event, offset));
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
