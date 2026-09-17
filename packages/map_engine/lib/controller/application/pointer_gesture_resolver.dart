import 'package:map_engine/controller/domain/domain.dart';
import 'package:map_engine/visual/domain/map_objects.dart';
import 'package:map_engine/visual/domain/offset_type.dart';

typedef GestureResolution = ({PointerGestureState state, MapGesture? gesture});

class PointerGestureResolver {
  GestureResolution resolve(PointerEventType event, PointerGestureState state) {
    switch ((state, event)) {
      case (IdleState(), PointerEventType.down):
        return (
          state: PressedState(element: e.element, offset: e.offset),
          gesture: null,
        );

      case (PressedState pressed, PointerEventType.move):
        final distance = (pressed.offset.value - e.offset.value).distance;

        if (distance < 8) {
          return (
            state: PointerGestureResolution(state: pressed),
            gesture: null,
          );
        }

        return PointerGestureResolution(
          state: DraggingState(element: pressed.element),
          gesture: DragStartGesture(pressed.element),
        );

      case (DraggingState dragging, MapPointerMove _):
        return PointerGestureResolution(
          state: dragging,
          gesture: DraggingGesture(dragging.element),
        );

      case (DraggingState dragging, MapPointerUp _):
        return PointerGestureResolution(
          state: const IdleState(),
          gesture: DragEndGesture(dragging.element),
        );

      case (PressedState pressed, MapPointerUp e):
        return PointerGestureResolution(
          state: PendingTap(element: pressed.element, offset: e.offset),
        );

      case (PendingTap pending, MapPointerDown e):
        if (pending.compare(e.element, e.offset)) {
          return PointerGestureResolution(
            state: const IdleState(),
            gesture: DoubleTapGesture(e.element),
          );
        }

        // Le premier tap était finalement un tap simple.
        // Le nouveau down démarre une nouvelle interaction.
        return PointerGestureResolution(
          state: PressedState(element: e.element, offset: e.offset),
          gesture: TapGesture(pending.element),
        );

      case (PendingTap pending, MapPointerTapTimeout _):
        return PointerGestureResolution(
          state: const IdleState(),
          gesture: TapGesture(pending.element),
        );
      case _:
    }

    return PointerGestureResolution(state: state);
  }
}
