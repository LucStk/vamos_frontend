// overlay.dart
import 'package:map_engine/src/gesture_engine/map_gesture.dart';
import 'package:map_engine/src/mode_engine/transition.dart';

enum Interception { pass, consume, dismiss, dismissAndConsume }

extension InterceptionX on Interception {
  bool get dismisses =>
      this == Interception.dismiss || this == Interception.dismissAndConsume;
  bool get consumes =>
      this == Interception.consume || this == Interception.dismissAndConsume;
}

/// Surcouche attachée à un mode, sans que le mode en porte l'état.
abstract class Overlay {
  const Overlay();

  Interception intercept(MapGesture event) => Interception.pass;

  /// `false` = cacher, `true` = montrer, `null` = ne rien changer.
  bool? visibleAfter(MapGesture event) => null;

  bool survives(Transition result) => false;
}
