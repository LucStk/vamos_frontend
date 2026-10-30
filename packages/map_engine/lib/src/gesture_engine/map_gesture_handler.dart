// map_engine/lib/src/input/map_gesture_handler.dart

import 'package:map_engine/src/gesture_engine/hit_test.dart';
import 'package:map_engine/src/gesture_engine/long_press_timer.dart';
import 'package:map_engine/src/gesture_engine/map_gesture.dart';
import 'package:map_engine/src/gesture_engine/map_pointer_event.dart';
import 'package:map_engine/src/gesture_engine/map_pointure_gesture_state.dart';
import 'package:map_engine/src/gesture_engine/pending_tap_timer.dart';
import 'package:map_engine/src/gesture_engine/pointer_gesture_resolver.dart';

class MapGestureHandler {
  MapGestureHandler({
    required MapGestureHost host,
    Duration tapTimeout = const Duration(milliseconds: 200),
    Duration longPressTimeout = const Duration(milliseconds: 500),
  }) : _host = host,
       _resolver = PointerGestureResolver(hitTester: host) {
    // Les timers passent directement par _feed : ils ne doivent jamais
    // être bloqués par l'état du clic droit.
    _tapTimer = PendingTapTimer(
      timeout: tapTimeout,
      onTimeout: (pending) => _feed(PointerTapTimeout(pending.position)),
    );
    _longPressTimer = LongPressTimer(
      timeout: longPressTimeout,
      onTimeout: (pressed) => _feed(PointerLongPressTimeout(pressed.position)),
    );
  }

  /// Fournisseur et non valeur : le controller change selon le scope
  /// (éditeur ou viewer), donc il est relu à chaque événement.
  final MapGestureHost _host;
  final PointerGestureResolver _resolver;
  late final PendingTapTimer _tapTimer;
  late final LongPressTimer _longPressTimer;

  bool _panAllowed = true;
  bool get panAllowed => _panAllowed;

  /// True entre un `down` secondaire et son `up` / `cancel`.
  bool _secondaryPressed = false;

  /// Point d'entrée unique. `button` n'a de sens que pour [PointerEventType.down].
  void onPointerEvent(PointerEvent pointer) {
    switch (pointer) {
      case PointerDown e:
        if (e.button == PointerButton.secondary) {
          _secondaryPressed = true;
          _sendSecondaryTap(e.position);
          return; // le clic droit n'alimente pas le resolver
        }
      case PointerMove _:
        if (_secondaryPressed) return;
      case PointerUp _:
      case PointerCancel _:
        if (_secondaryPressed) {
          _secondaryPressed = false;
          return;
        }
      case PointerTapTimeout _:
      case PointerLongPressTimeout _:
        break;
    }
    _feed(pointer);
  }

  void dispose() {
    _tapTimer.dispose();
    _longPressTimer.dispose();
  }

  // --- Interne -------------------------------------------------------------

  void _feed(PointerEvent pointer) {
    final gesture = _resolver.resolve(pointer);

    // Resynchro AVANT le dispatch : les listeners déclenchés par le
    // dispatch voient un état final.
    _syncTimers();
    _syncPanAllowed();

    if (gesture != null) _host.sink.send(gesture);
  }

  /// Le clic droit ne passe pas par le resolver : pas de pan, de drag ni de double tap.
  void _sendSecondaryTap(PointerPosition position) {
    final hit = _host.hitTest(offset: position.screen);
    _host.sink.send(SecondaryTapGesture(position, hit: hit));
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
      // Appui sur un élément déplaçable : la carte ne doit pas bouger,
      // même avant que le seuil de drag soit franchi.
      PressedState(:final element) || LongPressedState(:final element) =>
        element == null || !element.isDraggable,
      DraggingState() => false,
      _ => true, // Idle, PendingTap, PanningState
    };
    if (allowed == _panAllowed) return;
    _panAllowed = allowed;
    _host.onPanAllowedChanged(allowed);
  }
}
