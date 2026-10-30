import 'package:map_engine/src/gesture_engine/map_gesture.dart';
import 'package:map_engine/src/mode_engine/slots.dart';
import 'package:map_engine/src/mode_engine/transition.dart';

abstract class Mode {
  const Mode();

  Set<Slot> get retainedSlots => const {};

  Transition? dispatchGesture(MapGesture gesture) => switch (gesture) {
    PressGesture() => onPointerDown(gesture),
    DragStartGesture() => onDragStart(gesture),
    DragUpdateGesture() => onDragging(gesture),
    DragEndGesture() => onDragEnd(gesture),
    DragCancelGesture() => onDragCancel(gesture),
    TapGesture() => onTap(gesture),
    DoubleTapGesture() => onDoubleTap(gesture),
    LongPressGesture() => onLongPress(gesture),
    SecondaryTapGesture() => onSecondaryTap(gesture),
  };

  Transition onPointerDown(PressGesture g) => Transition.stay();
  Transition onDragStart(DragStartGesture g) => Transition.stay();
  Transition onDragging(DragUpdateGesture g) => Transition.stay();
  Transition onDragEnd(DragEndGesture g) => Transition.stay();
  Transition onDragCancel(DragCancelGesture g) => Transition.stay();
  Transition onTap(TapGesture g) => Transition.stay();
  Transition onDoubleTap(DoubleTapGesture g) => Transition.stay();
  Transition onLongPress(LongPressGesture g) => Transition.stay();
  Transition onSecondaryTap(SecondaryTapGesture g) => Transition.stay();
}
