import 'package:domain_core/space/offset_type.dart';
import 'package:map_engine/src/domain/map_hit.dart';
import 'package:map_engine/src/domain/objects/map_objects.dart';
import 'package:map_engine/src/gesture_engine/map_pointer_event.dart';

sealed class PointerGestureState {
  const PointerGestureState();
}

class IdleState extends PointerGestureState {
  const IdleState();
}

class PressedState extends PointerGestureState {
  const PressedState({required this.hit, required this.position});
  final MapHit? hit;
  final PointerPosition position;
  MapObject? get element => hit?.object; // le reste du code ne change pas
}

/// Le long press a été déclenché, le doigt est toujours posé.
/// Sert à ne PAS émettre de Tap au relâchement.
class LongPressedState extends PointerGestureState {
  const LongPressedState({required this.hit, required this.position});

  final MapHit? hit;
  final PointerPosition position;

  MapObject? get element => hit?.object; // le reste du code ne change pas
}

class PendingTap extends PointerGestureState {
  const PendingTap({
    required this.hit,
    required this.position,
    this.doubleTapMaxDistancePx = 24,
  });

  final MapHit? hit;
  final PointerPosition position;
  final double doubleTapMaxDistancePx;

  MapObject? get element => hit?.object; // le reste du code ne change pas

  bool compare(MapObject? otherElement, ScreenOffset otherOffset) {
    if ((position.screen.value - otherOffset.value).distance >
        doubleTapMaxDistancePx) {
      return false;
    }

    if (element == null && otherElement == null) {
      return true;
    }

    if (element == null || otherElement == null) {
      return false;
    }

    return element! == otherElement;
  }
}

class DraggingState extends PointerGestureState {
  const DraggingState({required this.dragged, this.hit});

  final MapObject dragged;
  final MapHit? hit; // peut potentiellement servir à rien
  // dans la nouvelle version de l'engine avec les slots
}

class PanningState extends PointerGestureState {
  const PanningState();
}
