import 'dart:ui';

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
    state: Pressed(element),
    panBlocked: element?.isDraggable ?? false,
    action: PointerDownAction(element: element, offset: event.offset),
    pendingTap: input.pendingTap,
    pressPoint: event.offset,
  );
}

PointerEventsResolverOutput _resolvePointerMove(
  PointerEventsResolverInput input,
) {
  final state = input.state;
  final pressPoint = input.pressPoint;
  final event = input.event;
  final pendingTap = input.pendingTap;
  final scene = input.scene;

  switch (state) {
    case Pressed(element: null):
      if (pressPoint != null &&
          distanceTo(pressPoint, event.offset) < pointerTapSlopPx) {
        return PointerEventsResolverOutput(
          state: state,
          panBlocked: false,
          pendingTap: pendingTap,
          pressPoint: pressPoint,
        );
      }

      return PointerEventsResolverOutput(
        state: const Dragging(),
        panBlocked: false,
        action: const DragStartAction(),
        pendingTap: pendingTap,
        pressPoint: pressPoint,
      );

    case Pressed(:final element):
      if (element != null && !element.isDraggable) {
        return PointerEventsResolverOutput(
          state: state,
          panBlocked: false,
          pendingTap: pendingTap,
          pressPoint: pressPoint,
        );
      }

      return PointerEventsResolverOutput(
        state: Dragging(dragged: element),
        panBlocked: element != null,
        action: DragStartAction(element: element),
        pendingTap: pendingTap,
        pressPoint: pressPoint,
      );

    case Dragging(:final dragged) when dragged != null:
      final target = scene.hitTest(event.offset, exclude: dragged);

      return PointerEventsResolverOutput(
        state: Dragging(dragged: dragged, target: target),
        panBlocked: true,
        action: DragUpdateAction(
          dragged: dragged,
          target: target,
          offset: event.offset,
        ),
        pendingTap: pendingTap,
        pressPoint: pressPoint,
      );

    case _:
      return PointerEventsResolverOutput(
        state: state,
        panBlocked: false,
        pendingTap: pendingTap,
        pressPoint: pressPoint,
      );
  }
}

PointerEventsResolverOutput _resolvePointerUp(
  PointerEventsResolverInput input,
) {
  final state = input.state;
  final event = input.event;
  final pendingTap = input.pendingTap;

  switch (state) {
    case Pressed(:final element):
      return _resolveTap(
        element: element,
        offset: event.offset,
        pendingTap: pendingTap,
      );

    case Dragging(:final dragged, :final target):
      return PointerEventsResolverOutput(
        state: const EmptyState(),
        panBlocked: false,
        action: DragEndAction(
          dragged: dragged,
          target: target,
          offset: event.offset,
        ),
        pendingTap: null,
        pressPoint: null,
      );

    case _:
      return PointerEventsResolverOutput(
        state: const EmptyState(),
        panBlocked: false,
        pendingTap: pendingTap,
        pressPoint: null,
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
      state: const EmptyState(),
      panBlocked: false,
      action: TapAction(element: element, offset: offset),
      pendingTap: null,
      pressPoint: null,
    );
  }

  // Deuxième tap compatible.
  if (pendingTap != null && pendingTap.compare(element, offset)) {
    return PointerEventsResolverOutput(
      state: const EmptyState(),
      panBlocked: false,
      action: DoubleTapAction(element: element, offset: offset),
      pendingTap: null,
      pressPoint: null,
    );
  }

  // Premier tap : il faut attendre pour savoir s'il devient
  // un tap simple ou le premier tap d'un double-tap.
  return PointerEventsResolverOutput(
    state: const EmptyState(),
    panBlocked: false,
    pendingTap: PendingTap(element: element, point: offset),
    pressPoint: null,
  );
}
