import '../../domain/gestures/map_gesture.dart';
import '../../domain/objects/map_objects.dart';
import '../../domain/selection.dart';
import '../../domain/slot.dart';
import '../../mode_machine/base_mode_model.dart';
import '../../mode_machine/gesture_result.dart';

class MapExploreMode extends BaseMode<MapExploreMode> {
  const MapExploreMode();
}

mixin ExploreIdleBehavior on MapExploreMode {
  @override
  Set<Slot> get retainedSlots => const {selectionSlot};
  @override
  GestureResult<MapExploreMode> onTap(TapGesture g) => switch (g.element) {
    MapTripObject e => GestureResult.set(selectionSlot, e.id),
    _ => GestureResult.none(),
  };
}
