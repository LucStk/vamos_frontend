import 'dart:async';
import 'map_pointure_gesture_state.dart';

class LongPressTimer {
  LongPressTimer({required this.timeout, required this.onTimeout});

  final Duration timeout;
  final void Function(PressedState pressed) onTimeout;

  Timer? _timer;
  PressedState? _armedFor;

  void update(PressedState pressed) {
    if (identical(_armedFor, pressed)) return; // déjà armé pour cet appui
    cancel();
    _armedFor = pressed;
    _timer = Timer(timeout, () {
      _armedFor = null;
      onTimeout(pressed);
    });
  }

  void cancel() {
    _timer?.cancel();
    _timer = null;
    _armedFor = null;
  }

  void dispose() => cancel();
}
