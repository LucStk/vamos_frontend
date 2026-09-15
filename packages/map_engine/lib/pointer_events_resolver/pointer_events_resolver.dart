import 'dart:ui';

import 'package:map_engine/domain/pointer_gesture_state.dart';
import 'package:map_engine/map_engine.dart';
import 'package:map_engine/pointer_events_resolver/pointer_events_resolver_input.dart';
import 'package:map_engine/pointer_events_resolver/pointer_events_resolver_output.dart';
import 'pending_tap.dart';

const double pointerTapSlopPx = 8;

double distanceTo(Offset p1, Offset p2) => (p1 - p2).distance;

PointerEventsResolverOutput resolvePointerEvent(
  PointerEventsResolverInput input,
) {
  switch (input.event) {
    case MapPointerDown():
      return _resolvePointerDown(input);

    case MapPointerMove():
      return _resolvePointerMove(input);

    case MapPointerUp():
      return _resolvePointerUp(input);
  }
}

PointerEventsResolverOutput _resolvePointerDown(
  PointerEventsResolverInput input,
) {
  final event = input.event as MapPointerDown;
  final element = input.scene.hitTest(event.offset);

  return PointerEventsResolverOutput(
    state: input.state.copyWith(
      gesture: Pressed(element: element, pressPoint: event.offset),
    ),
    action: PointerDownAction(element: element, offset: event.offset),
  );
}

PointerEventsResolverOutput _resolvePointerMove(
  PointerEventsResolverInput input,
) {
  final gesture = input.state.gesture;
  final event = input.event;
  final scene = input.scene;

  switch (gesture) {
    //Permet de donner un sensibilité au drag
    //On valide automatiquement si element n'est pas draggable
    case Pressed(:final element, :final pressPoint)
        when (element != null && !element.isDraggable) ||
            (distanceTo(pressPoint, event.offset) < pointerTapSlopPx):
      return PointerEventsResolverOutput(state: input.state);

    //begin drag si possible (element.isDraggable ou element == null)
    case Pressed(:final element):
      return PointerEventsResolverOutput(
        state: PointerGestureState(gesture: Dragging(dragged: element)),
        action: DragStartAction(element: element),
      );

    //On vérifie qu'il n'y a pas de collision
    case Dragging(:final dragged) when dragged != null:
      final target = scene.hitTest(event.offset, exclude: dragged);

      return PointerEventsResolverOutput(
        state: PointerGestureState(
          gesture: Dragging(dragged: dragged, target: target),
        ),
        action: DragUpdateAction(
          dragged: dragged,
          target: target,
          offset: event.offset,
        ),
      );

    case _:
      return PointerEventsResolverOutput(state: input.state);
  }
}

PointerEventsResolverOutput _resolvePointerUp(
  PointerEventsResolverInput input,
) {
  final state = input.state.gesture;
  final event = input.event;
  final pendingTap = input.state.pendingTap;

  switch (state) {
    case Pressed(:final element):
      return _resolveTap(
        element: element,
        offset: event.offset,
        pendingTap: pendingTap,
      );

    case Dragging(:final dragged, :final target):
      return PointerEventsResolverOutput(
        state: PointerGestureState(
          gesture: const EmptyState(),
          pendingTap: null,
        ),
        action: DragEndAction(
          dragged: dragged,
          target: target,
          offset: event.offset,
        ),
      );

    case _:
      return PointerEventsResolverOutput(
        state: PointerGestureState(
          gesture: const EmptyState(),
          pendingTap: null,
        ),
      );
  }
}

PointerEventsResolverOutput _resolveTap({
  required MapObject? element,
  required Offset offset,
  required PendingTap? pendingTap,
}) {
  // Élément sans double-tap : tap immédiat.
  if (element != null && !element.awaitsDoubleTap) {
    return PointerEventsResolverOutput(
      state: PointerGestureState(gesture: const EmptyState(), pendingTap: null),
      action: TapAction(element: element, offset: offset),
    );
  }

  // Deuxième tap compatible.
  if (pendingTap != null && pendingTap.compare(element, offset)) {
    return PointerEventsResolverOutput(
      state: PointerGestureState(gesture: const EmptyState(), pendingTap: null),

      action: DoubleTapAction(element: element, offset: offset),
    );
  }

  // Premier tap : il faut attendre pour savoir s'il devient
  // un tap simple ou le premier tap d'un double-tap.
  return PointerEventsResolverOutput(
    state: PointerGestureState(
      gesture: const EmptyState(),
      pendingTap: PendingTap(element: element, point: offset),
    ),
  );
}
