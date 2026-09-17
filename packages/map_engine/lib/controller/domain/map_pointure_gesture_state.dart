import 'package:map_engine/visual/visual.dart';

sealed class PointerGestureState {
  const PointerGestureState();
}

class IdleState extends PointerGestureState {
  const IdleState();
}

class PressedState extends PointerGestureState {
  const PressedState({required this.element, required this.offset});

  final MapObject? element;
  final WorldOffset offset;
}

class PendingTap extends PointerGestureState {
  const PendingTap({
    required this.element,
    required this.offset,
    this.doubleTapMaxDistancePx = 24,
  });

  final MapObject? element;
  final WorldOffset offset;
  final double doubleTapMaxDistancePx;

  bool compare(MapObject? otherElement, WorldOffset otherOffset) {
    if ((offset.value - otherOffset.value).distance > doubleTapMaxDistancePx) {
      return false;
    }

    if (element == null && otherElement == null) {
      return true;
    }

    if (element == null || otherElement == null) {
      return false;
    }

    return element!.isSameAs(otherElement);
  }
}

class DraggingState extends PointerGestureState {
  const DraggingState({required this.element});

  final MapObject? element;
}
