import '../../domain/gestures/map_gesture.dart';
import '../../domain/objects/map_objects.dart';
import '../../domain/selection.dart';
import '../../mode_machine/slot.dart';
import '../../mode_machine/mode.dart';
import '../../mode_machine/transition.dart';
import 'explore_command.dart';

class MapExploreMode extends Mode<MapExploreMode> with ExploreIdleBehavior {
  const MapExploreMode();
}

mixin ExploreIdleBehavior on Mode<MapExploreMode> {
  @override
  Set<Slot> get retainedSlots => const {selectionSlot};
  @override
  Transition<MapExploreMode> onTap(TapGesture g) => switch (g.element) {
    MapTrip e => Transition.run(FocusTrip(e)).and(selectionSlot, e),
    _ => Transition.stay(),
  };
}
