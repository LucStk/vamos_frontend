import 'package:map_engine/domain/domain.dart';

class MapPointerMove extends MapPointerEvent {
  final WorldOffset offset;
  final double scale;
  const MapPointerMove(this.offset, this.scale);

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
