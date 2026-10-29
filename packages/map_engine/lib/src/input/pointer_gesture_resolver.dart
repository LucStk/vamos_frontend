import 'package:domain_core/space/offset_type.dart';
import 'package:map_engine/src/domain/gestures/map_gesture.dart';
import 'package:map_engine/src/domain/map_hit.dart';
import 'package:map_engine/src/domain/objects/map_objects.dart';
import 'package:map_engine/src/input/map_pointer_event.dart';
import 'package:map_engine/src/input/map_pointure_gesture_state.dart';

typedef GestureResolution = ({PointerGestureState state, MapGesture? gesture});
typedef HitTest =
    MapHit? Function({required ScreenOffset offset, MapObject? exclude});

class PointerGestureResolver {
  static const double dragStartThreshold = 5;
  PointerGestureState state;
  final HitTest hitTest;
  PointerGestureResolver({required this.hitTest}) : state = IdleState();

  MapGesture? resolve(PointerEvent pointer) {
    switch ((state, pointer)) {
      case (IdleState(), PointerDown e):
        final hit = hitTest(offset: e.screen);
        state = PressedState(hit: hit, position: pointer.position);
        return PressGesture(e.position, hit: hit);

      case (PressedState pressed, PointerMove e):
        final distance =
            (pressed.position.screen - e.position.screen).value.distance;
        if (distance < dragStartThreshold) return null;

        final element = pressed.element;
        if (element == null || !element.isDraggable) {
          state = const PanningState();
          return null;
        }
        state = DraggingState(dragged: element);
        return DragStartGesture(e.position, dragged: element);

      case (LongPressedState longPressed, PointerMove e):
        final distance =
            (longPressed.position.screen - e.position.screen).value.distance;
        if (distance < dragStartThreshold) return null;

        final element = longPressed.element;
        if (element == null || !element.isDraggable) {
          state = const PanningState();
          return null;
        }
        state = DraggingState(dragged: element);
        return DragStartGesture(e.position, dragged: element);

      case (PanningState _, PointerMove _):
        return null;

      case (PanningState _, PointerUp _) || (PanningState _, PointerCancel _):
        state = const IdleState();
        return null;

      case (PressedState pressed, PointerLongPressTimeout e):
        state = LongPressedState(hit: pressed.hit, position: e.position);
        return LongPressGesture(pressed.position, hit: pressed.hit);

      case (PressedState pressed, PointerUp e):
        //Dans le cas où l'élément ne peut pas avoir de doubleTap, on envoie directement le tap
        if (pressed.element != null && !pressed.element!.awaitsDoubleTap) {
          state = const IdleState();

          return TapGesture(e.position, hit: pressed.hit);
        }
        state = PendingTap(hit: pressed.hit, position: e.position);
        return null;

      case (LongPressedState _, PointerUp _):
        state = const IdleState();
        return null; // pas de Tap : le long press a déjà été émis

      case (DraggingState dragging, PointerMove e):
        // On fait le testhit pour détecter si on touche un
        // element autre celui que l'on déplace
        final hit = hitTest(
          offset: e.position.screen,
          exclude: dragging.dragged,
        );
        state = DraggingState(dragged: dragging.dragged, hit: hit);
        return DragUpdateGesture(
          e.position,
          dragged: dragging.dragged,
          hit: hit,
        );

      case (DraggingState dragging, PointerUp e):
        state = const IdleState();
        return DragEndGesture(
          e.position,
          dragged: dragging.dragged,
          hit: dragging.hit,
        );

      case (PendingTap pending, PointerDown e):
        final hit = hitTest(offset: e.screen);
        if (pending.compare(hit?.object, e.screen)) {
          state = IdleState();
          return DoubleTapGesture(e.position, hit: hit);
        }
        state = PressedState(hit: hit, position: e.position);
        // Le premier tap était finalement un tap simple.
        // Le nouveau down démarre une nouvelle interaction.
        return TapGesture(e.position, hit: pending.hit);

      case (PendingTap pending, PointerTapTimeout e):
        state = const IdleState();
        return TapGesture(e.position, hit: pending.hit);
      // --- Annulation (le système a repris le pointeur) -------------------
      case (DraggingState dragging, PointerCancel e):
        // Un DragStart a déjà été émis : le sink doit être prévenu pour
        // restaurer l'état (position d'origine du waypoint, mode, etc.).
        state = const IdleState();
        return DragCancelGesture(e.position, dragged: dragging.dragged);

      case (PressedState _, PointerCancel _):
      case (LongPressedState _, PointerCancel _):
        // Aucun drag en cours : on abandonne sans émettre de Tap.
        state = const IdleState();
        return null;
      case _:
    }

    return null;
  }
}
