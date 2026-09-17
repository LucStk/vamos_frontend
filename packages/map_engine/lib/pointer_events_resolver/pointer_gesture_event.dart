import 'dart:ui';
import 'package:map_engine/domain/pointer_gesture_state.dart';
import 'package:map_engine/map_engine.dart';

const double pointerTapSlopPx = 8;

double distanceTo(Offset p1, Offset p2) => (p1 - p2).distance;

sealed class MapPointerEvent {
  final WorldOffset offset;
  final double scale;
  const MapPointerEvent(this.offset, this.scale);

  PointerEventResolution resolve(PointerEventsResolverContext context);
}

class MapPointerDown extends MapPointerEvent {
  const MapPointerDown(super.offset, super.scale);

  @override
  PointerEventResolution resolve(PointerEventsResolverContext context) {
    final element = context.scene.hitTest(offset, scale);
    print("mapPointerdown $element");

    return PointerEventResolution(
      state: context.state.copyWith(
        gesture: Pressed(element: element, pressPoint: offset),
      ),
      action: PointerDownAction(element: element, offset: offset),
    );
  }
}

class MapPointerMove extends MapPointerEvent {
  const MapPointerMove(super.offset, super.scale);

  @override
  PointerEventResolution resolve(PointerEventsResolverContext context) {
    final gesture = context.state.gesture;
    final scene = context.scene;

    switch (gesture) {
      //Permet de donner un sensibilité au drag
      //On valide automatiquement si element n'est pas draggable
      case Pressed(:final element, :final pressPoint)
          when (element != null && !element.isDraggable) ||
              (distanceTo(pressPoint.value, offset.value) < pointerTapSlopPx):
        return PointerEventResolution(state: context.state);

      //begin drag si possible (element.isDraggable ou element == null)
      case Pressed(:final element):
        return PointerEventResolution(
          state: PointerGestureState(gesture: Dragging(dragged: element)),
          action: DragStartAction(element: element),
        );

      //On vérifie qu'il n'y a pas de collision
      case Dragging(:final dragged) when dragged != null:
        final target = scene.hitTest(offset, scale, exclude: dragged);

        return PointerEventResolution(
          state: PointerGestureState(
            gesture: Dragging(dragged: dragged, target: target),
          ),
          action: DragUpdateAction(
            dragged: dragged,
            target: target,
            offset: offset,
          ),
        );

      case _:
        return PointerEventResolution(state: context.state);
    }
  }
}

class MapPointerUp extends MapPointerEvent {
  const MapPointerUp(super.offset, super.scale);

  @override
  PointerEventResolution resolve(PointerEventsResolverContext context) {
    final state = context.state.gesture;
    final pendingTap = context.state.pendingTap;

    switch (state) {
      case Pressed(:final element):
        return _resolveTap(
          element: element,
          offset: offset,
          pendingTap: pendingTap,
        );

      case Dragging(:final dragged, :final target):
        return PointerEventResolution(
          state: PointerGestureState(
            gesture: const EmptyState(),
            pendingTap: null,
          ),
          action: DragEndAction(
            dragged: dragged,
            target: target,
            offset: offset,
          ),
        );

      case _:
        return PointerEventResolution(
          state: PointerGestureState(
            gesture: const EmptyState(),
            pendingTap: null,
          ),
        );
    }
  }
}

PointerEventResolution _resolveTap({
  required MapObject? element,
  required WorldOffset offset,
  required PendingTap? pendingTap,
}) {
  // Élément sans double-tap : tap immédiat.
  if (element != null && !element.awaitsDoubleTap) {
    return PointerEventResolution(
      state: PointerGestureState(gesture: const EmptyState(), pendingTap: null),
      action: TapAction(element: element, offset: offset),
    );
  }

  // Deuxième tap compatible.
  if (pendingTap != null && pendingTap.compare(element, offset)) {
    return PointerEventResolution(
      state: PointerGestureState(gesture: const EmptyState(), pendingTap: null),
      action: DoubleTapAction(element: element, offset: offset),
    );
  }

  // Premier tap : il faut attendre pour savoir s'il devient
  // un tap simple ou le premier tap d'un double-tap.
  return PointerEventResolution(
    state: PointerGestureState(
      gesture: const EmptyState(),
      pendingTap: PendingTap(element: element, point: offset),
    ),
  );
}

class PointerEventsResolverContext {
  const PointerEventsResolverContext({
    required this.scene,
    required this.state,
  });

  /// Scène projetée au moment de l'événement.
  final ProjectedScene scene;

  /// État courant du gesture resolver.
  final PointerGestureState state;
}

class PointerEventResolution {
  const PointerEventResolution({required this.state, this.action});

  final PointerGestureState state;

  /// Action reconnue à transmettre au GesturesResolver.
  final PointerGestureAction? action;
}
