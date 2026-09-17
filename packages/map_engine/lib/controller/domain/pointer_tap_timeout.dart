// class MapPointerTapTimeout extends MapPointerEvent {
//   const MapPointerTapTimeout();

//   @override
//   PointerEventResolution resolve(PointerEventsResolverContext context) {
//     final pendingTap = context.gestureState;

//     if (pendingTap case PendingTap e) {
//       return PointerEventResolution(
//         gestureState: const EmptyState(),
//         action: TapAction(element: e.element, offset: e.point),
//       );
//     }
//     return PointerEventResolution(gestureState: context.gestureState);
//   }
// }
