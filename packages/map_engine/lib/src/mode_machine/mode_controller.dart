import '../domain/gestures/gesture_sink.dart';
import '../domain/gestures/map_gesture.dart';
import '../domain/selection.dart';
import '../domain/space/offset_type.dart';
import 'base_mode_model.dart';
import 'effect_queue.dart';
import 'transition.dart';
import 'mode_command.dart';
import 'overlay/overlay.dart';
import 'mode_state.dart';

mixin ModeControllerMixin<M extends BaseMode<M>> implements ModeHost {
  ModeState<M> get state;
  void setState(ModeState<M> state);
  M get mode => state.mode;

  ModeCommandResolver<M> get resolver;
  EffectQueue get effectQueue;
  // dans la classe MapEditor
  void actOnSelection<S extends Selection>(
    Transition<M>? Function(S s) action,
  ) {
    if (state.context.get(selectionSlot) case final S s) apply(action(s));
  }

  @override
  void send(MapGesture event, ScreenOffset offset) {
    final interception =
        state.overlay?.intercept(event, offset) ?? Interception.pass;

    if (interception.dismisses) dismissDecorator();
    if (interception.consumes) return;

    apply(mode.dispatchGesture(event, offset));
  }

  /// Exécute l'intent seulement si le mode courant est bien du type T.
  void act<T extends M>(Transition<M>? Function(T mode) intent) {
    final current = mode;
    if (current is T) apply(intent(current));
  }

  /// Exécute l'action seulement si la sélection courante est de type S.
  @override
  void dismissDecorator() {
    if (state.overlay != null) {
      setState(ModeState(mode, null, state.context));
    }
  }

  void apply(Transition<M>? result, {bool fromEffect = false}) {
    if (result == null) return;

    final current = state.overlay;
    final nextMode = result.mode ?? mode;

    var ctx = state.context;
    if (nextMode != mode) ctx = ctx.afterTransition(nextMode);
    for (final (slot, value) in result.slots) {
      ctx = ctx.withSlot(slot, value);
    }

    final keep =
        current != null &&
        (fromEffect ? result.mode == null : current.survives(result));
    final nextDecorator = result.overlay ?? (keep ? current : null);

    if (!identical(nextMode, mode) ||
        !identical(nextDecorator, current) ||
        ctx != state.context) {
      setState(ModeState(nextMode, nextDecorator, ctx));
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
