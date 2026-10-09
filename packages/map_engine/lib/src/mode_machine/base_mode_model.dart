import '../domain/gestures/map_gesture.dart';
import '../domain/slot.dart';
import '../domain/space/offset_type.dart';
import 'base_command.dart';
import 'transition.dart';

typedef PopUpPositionType = ScreenOffset?;

abstract class BaseMode<Self extends BaseMode<Self>> {
  const BaseMode();

  /// Slots qui restent vivants tant qu'on est dans ce mode.
  /// Tout autre slot est vidé à l'entrée. Par défaut : aucun.
  Set<Slot> get retainedSlots => const {};

  Transition<Self>? dispatchGesture(MapGesture gesture, ScreenOffset offset) {
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

  Transition<Self> onPointerDown(PointerDownGesture g, ScreenOffset p) =>
      Transition.none();
  Transition<Self> onDragStart(DragStartGesture g) => Transition.none();
  Transition<Self> onDragging(DraggingGesture g, ScreenOffset p) =>
      Transition.none();
  Transition<Self> onDragEnd(DragEndGesture g) => Transition.none();
  Transition<Self> onTap(TapGesture g) => Transition.none();
  Transition<Self> onDoubleTap(DoubleTapGesture g) =>
      Transition.run(ZoomIn(g.offset));
  Transition<Self> onLongPress(LongPressGesture g) => Transition.none();
  Transition<Self> onSecondaryTap(SecondaryTapGesture g) => Transition.none();
}
