// map_engine/lib/src/input/map_gesture_handler.dart
import '../domain/gestures/gesture_sink.dart';
import '../domain/gestures/map_gesture.dart';
import '../domain/space/offset_type.dart';
import 'long_press_timer.dart';
import 'map_pointer_event.dart';
import 'map_pointure_gesture_state.dart';
import 'pending_tap_timer.dart';
import 'pointer_gesture_resolver.dart';

class MapGestureHandler {
  MapGestureHandler({
    required GestureSink Function() sink,
    required HitTest hitTest,
    required void Function(bool allowed) onPanAllowedChanged,
    Duration tapTimeout = const Duration(milliseconds: 149),
    Duration longPressTimeout = const Duration(milliseconds: 500),
  }) : _sink = sink,
       _hitTest = hitTest,
       _onPanAllowedChanged = onPanAllowedChanged,
       _resolver = PointerGestureResolver(hitTest: hitTest) {
    _tapTimer = PendingTapTimer(
      timeout: tapTimeout,
      onTimeout: (pending) =>
          onPointerEvent(PointerEventType.tapTimeout, pending.offset),
    );
    _longPressTimer = LongPressTimer(
      timeout: longPressTimeout,
      onTimeout: (pressed) =>
          onPointerEvent(PointerEventType.longPressTimeout, pressed.offset),
    );
  }

  /// Fournisseur et non valeur : le controller change selon le scope
  /// (éditeur ou viewer), donc il est relu à chaque événement.
  final GestureSink Function() _sink;
  final HitTest _hitTest;
  final void Function(bool allowed) _onPanAllowedChanged;
  final PointerGestureResolver _resolver;
  late final PendingTapTimer _tapTimer;
  late final LongPressTimer _longPressTimer;

  bool _panAllowed = true;
  bool get panAllowed => _panAllowed;

  void onPointerEvent(PointerEventType event, ScreenOffset offset) {
    final gesture = _resolver.resolve(event, offset);

    // Resynchro AVANT le dispatch : les listeners déclenchés par le
    // dispatch voient un état final.
    _syncTimers();
    _syncPanAllowed();

    if (gesture != null) _sink().send(gesture);
  }

  /// Le clic droit ne passe pas par le resolver : pas de pan, de drag ni de double tap.
  void onSecondaryClick(ScreenOffset offset) {
    final element = _hitTest(offset: offset);
    _sink().send(SecondaryTapGesture(offset, element: element));
  }

  void dispose() {
    _tapTimer.dispose();
    _longPressTimer.dispose();
  }

  void _syncTimers() {
    switch (_resolver.state) {
      case final PendingTap pending:
        _longPressTimer.cancel();
        _tapTimer.update(pending);
      case final PressedState pressed:
        _tapTimer.cancel();
        _longPressTimer.update(pressed);
      case _:
        _tapTimer.cancel();
        _longPressTimer.cancel();
    }
  }

  void _syncPanAllowed() {
    final allowed = switch (_resolver.state) {
      DraggingState(:final dragged) => dragged == null,
      _ => true,
    };
    if (allowed == _panAllowed) return;
    _panAllowed = allowed;
    _onPanAllowedChanged(allowed);
  }
}
