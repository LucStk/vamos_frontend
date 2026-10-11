import '../domain/objects/map_objects.dart';
import '../domain/space/offset_type.dart';
import 'map_pointer_event.dart';

sealed class PointerGestureState {
  const PointerGestureState();
}

class IdleState extends PointerGestureState {
  const IdleState();
}

class PressedState extends PointerGestureState {
  const PressedState({required this.element, required this.position});

  final MapObject? element;
  final PointerPosition position;
}

/// Le long press a été déclenché, le doigt est toujours posé.
/// Sert à ne PAS émettre de Tap au relâchement.
class LongPressedState extends PointerGestureState {
  const LongPressedState({required this.element, required this.position});

  final MapObject? element;
  final PointerPosition position;
}

class PendingTap extends PointerGestureState {
  const PendingTap({
    required this.element,
    required this.position,
    this.doubleTapMaxDistancePx = 24,
  });

  final MapObject? element;
  final PointerPosition position;
  final double doubleTapMaxDistancePx;

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
  const DraggingState({required this.dragged, this.target});

  final MapObject? dragged;
  final MapObject? target; // peut potentiellement servir à rien
  // dans la nouvelle version de l'engine avec les slots
}
