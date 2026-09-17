import "package:map_engine/domain/domain.dart";

class MapPointerTapTimeout extends MapPointerEvent {
  const MapPointerTapTimeout(super.offset, super.scale);

  @override
  PointerEventResolution resolve(PointerEventsResolverContext context) {
    final pendingTap = context.state.pendingTap;

    if (pendingTap == null) {
      return PointerEventResolution(state: context.state);
    }

    return PointerEventResolution(
      state: PointerGestureState(gesture: const EmptyState(), pendingTap: null),
      action: TapAction(element: pendingTap.element, offset: pendingTap.point),
    );
  }
}
