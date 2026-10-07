import '../domain/gestures/map_gesture.dart';
import '../domain/space/offset_type.dart';
import 'base_command.dart';
import 'gesture_result.dart';

typedef PopUpPositionType = ScreenOffset?;

abstract class BaseMode<Self extends BaseMode<Self>> {
  const BaseMode();

  GestureResult<Self>? dispatchGesture(
    MapGesture gesture,
    ScreenOffset offset,
  ) {
    return switch (gesture) {
      PointerDownGesture() => onPointerDown(gesture, offset),
      DragStartGesture() => onDragStart(gesture),
      DraggingGesture() => onDragging(gesture, offset),
      DragEndGesture() => onDragEnd(gesture),
      TapGesture() => onTap(gesture),
      DoubleTapGesture() => onDoubleTap(gesture),
      LongPressGesture() => onLongPress(gesture),
      SecondaryTapGesture() => onSecondaryTap(gesture),
    };
  }

  GestureResult<Self> onPointerDown(PointerDownGesture g, ScreenOffset p) =>
      GestureResult.none();
  GestureResult<Self> onDragStart(DragStartGesture g) => GestureResult.none();
  GestureResult<Self> onDragging(DraggingGesture g, ScreenOffset p) =>
      GestureResult.none();
  GestureResult<Self> onDragEnd(DragEndGesture g) => GestureResult.none();
  GestureResult<Self> onTap(TapGesture g) => GestureResult.none();
  GestureResult<Self> onDoubleTap(DoubleTapGesture g) =>
      GestureResult.run(ZoomIn(g.offset));
  GestureResult<Self> onLongPress(LongPressGesture g) => GestureResult.none();
  GestureResult<Self> onSecondaryTap(SecondaryTapGesture g) =>
      GestureResult.none();
}
