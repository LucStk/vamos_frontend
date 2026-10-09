import 'map_gesture.dart';

abstract interface class GestureSink {
  void send(MapGesture event);
}

abstract interface class ModeHost implements GestureSink {
  void dismissOverlay();
}
