import 'package:domain_core/domain_core.dart';
import 'package:map_engine/src/domain/domain.dart';
import 'package:map_engine/src/gesture_engine/map_gesture.dart';

// input/hit_tester.dart
abstract interface class HitTester {
  HitObject? hitTest({
    required ScreenOffset offset,
    MapObject? exclude,
    bool dropTargetsOnly = false,
  });

  DragDetail? dragDetail(MapObject dragged, WorldOffset p);
}

abstract interface class GestureSink {
  void send(MapGesture event);
  void dismissOverlay();
}

// input/map_gesture_host.dart
abstract interface class MapGestureHost implements HitTester {
  /// Relu à chaque geste : le controller change selon le scope.
  void onPanAllowedChanged(bool allowed);
  GestureSink get sink;
}
