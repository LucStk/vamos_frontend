import '../../domain/gestures/map_gesture.dart';
import '../../domain/objects/map_objects.dart';
import '../../domain/selection.dart';
import '../../mode_machine/slot.dart';
import '../../mode_machine/base_mode_model.dart';
import '../../mode_machine/transition.dart';

class MapExploreMode extends BaseMode<MapExploreMode> with ExploreIdleBehavior {
  const MapExploreMode();
}

mixin ExploreIdleBehavior on BaseMode<MapExploreMode> {
  @override
  Set<Slot> get retainedSlots => const {selectionSlot};
  @override
  Transition<MapExploreMode> onTap(TapGesture g) => switch (g.element) {
    MapTripObject e => Transition.set(selectionSlot, TripSelection(e.id)),
    _ => Transition.stay(),
  };
}
