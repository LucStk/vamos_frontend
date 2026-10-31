import 'package:map_engine/src/gesture_engine/hit_test.dart';
import 'package:map_engine/src/gesture_engine/map_gesture.dart';
import 'package:map_engine/src/gesture_engine/map_pointer_event.dart';
import 'package:map_engine/src/gesture_engine/map_pointure_gesture_state.dart';

class PointerGestureResolver {
  PointerGestureResolver({required this.hitTester}) : state = IdleState();

  static const double dragStartThreshold = 5;
  PointerGestureState state;
  final HitTester hitTester;

  MapGesture? resolve(PointerEvent pointer) {
    switch ((state, pointer)) {
      case (IdleState(), PointerDown e):
        final hit = hitTester.hitTest(offset: e.screen);
        state = PressedState(hit: hit, pressPosition: e.position);
        return PressGesture(e.position, hit: hit);

      // Press ou long press, puis mouvement : pan ou début de drag.
      case (PressedState(:final hit, :final pressPosition), PointerMove e) ||
          (LongPressedState(:final hit, :final pressPosition), PointerMove e):
        if ((pressPosition.screen - e.position.screen).value.distance <
            dragStartThreshold) {
          return null;
        }
        if (hit == null || !hit.object.isDraggable) {
          state = const PanningState();
          return null;
        }
        state = DraggingState(source: hit, pressPosition: pressPosition);
        return DragStartGesture(
          e.position,
          source: hit,
          pressPosition: pressPosition,
        );

      case (PanningState _, PointerMove _):
        return null;

      case (PanningState _, PointerUp _) || (PanningState _, PointerCancel _):
        state = const IdleState();
        return null;

      case (PressedState pressed, PointerLongPressTimeout _):
        state = LongPressedState(
          hit: pressed.hit,
          pressPosition: pressed.pressPosition,
        );
        return LongPressGesture(pressed.pressPosition, hit: pressed.hit);

      case (PressedState pressed, PointerUp e):
        // Un élément sans double tap émet le Tap tout de suite.
        if (pressed.element != null && !pressed.element!.awaitsDoubleTap) {
          state = const IdleState();
          return TapGesture(e.position, hit: pressed.hit);
        }
        state = PendingTap(hit: pressed.hit, pressPosition: e.position);
        return null;

      case (LongPressedState _, PointerUp _):
        state = const IdleState();
        return null; // pas de Tap : le long press a déjà été émis

      case (DraggingState dragging, PointerMove e):
        // Cible de dépôt : ni l'objet déplacé, ni les proxys du pointeur.
        final target = hitTester.hitTest(
          offset: e.position.screen,
          exclude: dragging.excluded,
          dropTargetsOnly: true,
        );
        state = dragging.withTarget(target);
        return DragUpdateGesture(
          e.position,
          source: dragging.source,
          pressPosition: dragging.pressPosition,
          target: target,
        );

      case (DraggingState dragging, PointerUp e):
        state = const IdleState();
        return DragEndGesture(
          e.position,
          source: dragging.source,
          pressPosition: dragging.pressPosition,
          target: dragging.target,
        );

      // Le système a repris le pointeur : un DragStart a déjà été émis,
      // les modes doivent pouvoir restaurer leur état (onDragCancel).
      case (DraggingState dragging, PointerCancel e):
        state = const IdleState();
        return DragCancelGesture(
          e.position,
          source: dragging.source,
          pressPosition: dragging.pressPosition,
        );

      case (PendingTap pending, PointerDown e):
        final hit = hitTester.hitTest(offset: e.screen);
        if (pending.compare(hit?.object, e.screen)) {
          state = IdleState();
          return DoubleTapGesture(e.position, hit: hit);
        }
        // Le premier tap était finalement un tap simple ;
        // le nouveau down démarre une nouvelle interaction.
        state = PressedState(hit: hit, pressPosition: e.position);
        return TapGesture(e.position, hit: pending.hit);

      case (PendingTap pending, PointerTapTimeout e):
        state = const IdleState();
        return TapGesture(e.position, hit: pending.hit);

      case (PressedState _, PointerCancel _) ||
          (LongPressedState _, PointerCancel _):
        // Aucun drag en cours : on abandonne sans émettre de Tap.
        state = const IdleState();
        return null;

      case _:
        return null;
    }
  }
}
