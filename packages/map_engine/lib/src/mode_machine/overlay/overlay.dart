// overlay.dart
import '../../domain/gestures/map_gesture.dart';
import '../../domain/space/offset_type.dart';
import '../base_mode_model.dart';
import '../transition.dart';

enum Interception { pass, consume, dismiss, dismissAndConsume }

extension InterceptionX on Interception {
  bool get dismisses =>
      this == Interception.dismiss || this == Interception.dismissAndConsume;
  bool get consumes =>
      this == Interception.consume || this == Interception.dismissAndConsume;
}

/// Surcouche attachée à un mode, sans que le mode en porte l'état.
abstract class Overlay<M extends BaseMode<M>> {
  const Overlay();

  /// Appelé AVANT le mode. Peut absorber la gesture, ou se retirer.
  Interception intercept(MapGesture event, ScreenOffset offset) =>
      Interception.pass;

  /// Le décorateur survit-il à ce résultat du mode ?
  /// Par défaut non : toute réaction du mode le retire.
  bool survives(Transition<M> result) => false;
}
