import 'package:map_engine/map_engine.dart';

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
