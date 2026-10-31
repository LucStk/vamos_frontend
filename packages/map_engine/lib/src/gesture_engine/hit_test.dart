import 'package:domain_core/space/offset_type.dart';
import 'package:map_engine/src/domain/map_hit.dart';
import 'package:map_engine/src/domain/objects/map_objects.dart';
import 'package:map_engine/src/gesture_engine/map_gesture.dart';

// input/hit_tester.dart
abstract interface class HitTester {
  HitObject? hitTest({
    required ScreenOffset offset,
    MapObject? exclude,
    bool dropTargetsOnly = false,
  });
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
