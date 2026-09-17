import 'package:map_engine/map_engine.dart';

class MapPointerUp extends MapPointerEvent {
  final WorldOffset offset;
  final double scale;
  const MapPointerUp(this.offset, this.scale);

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
