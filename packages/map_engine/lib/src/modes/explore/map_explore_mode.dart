import '../../domain/gestures/map_gesture.dart';
import '../../domain/objects/map_objects.dart';
import '../../domain/selection.dart';
import '../../mode_machine/slot.dart';
import '../../mode_machine/mode.dart';
import '../../mode_machine/transition.dart';

class MapExploreMode extends Mode<MapExploreMode> with ExploreIdleBehavior {
  const MapExploreMode();
}

mixin ExploreIdleBehavior on Mode<MapExploreMode> {
  @override
  Set<Slot> get retainedSlots => const {selectionSlot};
  @override
  Transition<MapExploreMode> onTap(TapGesture g) => switch (g.element) {
    MapTripObject e => Transition.set(selectionSlot, TripSelection(e.id)),
    _ => Transition.stay(),
  };
}
