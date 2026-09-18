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
        return PointerDownGesture(offset, element: element);

      case (PressedState pressed, PointerEventType.move):
        final distance = (pressed.offset.value - offset.value).distance;

        if (distance < dragStartThreshold) {
          // Le move peut être un accident
          return null;
        }
        // On commence le drag
        state = DraggingState(dragged: pressed.element);
        return DragStartGesture(offset, dragged: pressed.element);

      case (DraggingState dragging, PointerEventType.move):
        // On fait le testhit pour détecter si on touche un
        // element autre celui que l'on déplace
        final target = hitTest(offset: offset, exclude: dragging.dragged);
        return DraggingGesture(
          offset,
          dragged: dragging.dragged,
          target: target,
        );

      case (DraggingState dragging, PointerEventType.up):
        state = const IdleState();
        return DragEndGesture(
          offset,
          dragged: dragging.dragged,
          target: dragging.target,
        );

      case (PressedState pressed, PointerEventType.up):
        state = PendingTap(element: pressed.element, offset: offset);
        return null;

      case (PendingTap pending, PointerEventType.down):
        final element = hitTest(offset: offset);
        if (pending.compare(element, offset)) {
          state = IdleState();
          return DoubleTapGesture(offset, element: element);
        }
        state = PressedState(element: element, offset: offset);
        // Le premier tap était finalement un tap simple.
        // Le nouveau down démarre une nouvelle interaction.
        return TapGesture(offset, element: pending.element);

      case (PendingTap pending, PointerEventType.tapTimeout):
        state = const IdleState();
        return TapGesture(offset, element: pending.element);
      case _:
    }
    return null;
  }
}
