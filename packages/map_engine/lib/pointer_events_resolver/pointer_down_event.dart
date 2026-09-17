import 'package:map_engine/map_engine.dart';

class MapPointerDown extends MapPointerEvent {
  final WorldOffset offset;
  final double scale;
  const MapPointerDown(this.offset, this.scale);

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
