import 'package:map_engine/controller/domain/domain.dart';
import 'package:map_engine/visual/domain/map_objects.dart';
import 'package:map_engine/visual/domain/offset_type.dart';

typedef GestureResolution = ({PointerGestureState state, MapGesture? gesture});
typedef HitTest =
    MapObject? Function({required WorldOffset offset, MapObject? exclude});

class PointerGestureResolver {
  static const double dragStartThreshold = 8;
  PointerGestureState state;
  final HitTest hitTest;
  PointerGestureResolver({required this.hitTest}) : state = IdleState();

  MapGesture? resolve(PointerEventType eventType, WorldOffset offset) {
    switch ((state, eventType)) {
      case (IdleState(), PointerEventType.down):
        final element = hitTest(offset: offset);
        state = PressedState(element: element, offset: offset);
        return null;

      case (PressedState pressed, PointerEventType.move):
        final distance = (pressed.offset.value - offset.value).distance;

        if (distance < dragStartThreshold) {
          // Le move peut être un accident
          return null;
        }
        // On commence le drag
        state = DraggingState(element: pressed.element);
        return DragStartGesture(pressed.element);

      case (DraggingState dragging, PointerEventType.move):
        return DraggingGesture(dragging.element);

      case (DraggingState dragging, PointerEventType.up):
        state = const IdleState();
        return DragEndGesture(dragging.element);

      case (PressedState pressed, PointerEventType.up):
        state = PendingTap(element: pressed.element, offset: offset);
        return null;

      case (PendingTap pending, PointerEventType.down):
        final element = hitTest(offset: offset);
        if (pending.compare(element, offset)) {
          state = IdleState();
          return DoubleTapGesture(element);
        }
        state = PressedState(element: element, offset: offset);
        // Le premier tap était finalement un tap simple.
        // Le nouveau down démarre une nouvelle interaction.
        return TapGesture(pending.element);

      case (PendingTap pending, PointerEventType.tapTimeout):
        state = const IdleState();
        return TapGesture(pending.element);
      case _:
    }
    return null;
  }
}
