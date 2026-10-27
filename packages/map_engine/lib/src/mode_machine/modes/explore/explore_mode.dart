import 'package:map_engine/src/domain/gestures/map_gesture.dart';
import 'package:map_engine/src/domain/objects/map_objects.dart';
import 'package:map_engine/src/mode_machine/command/effect/results.dart';
import 'package:map_engine/src/mode_machine/command/explore_command.dart';
import 'package:map_engine/src/mode_machine/modes/modes.dart';
import 'package:map_engine/src/mode_machine/slots/selection_slot.dart';
import 'package:map_engine/src/mode_machine/slots/slot.dart';
import 'package:map_engine/src/mode_machine/transition.dart';

class ExploreMode extends AppMode {
  const ExploreMode();

  @override
  Set<Slot> get retainedSlots => const {selectionSlot};

  @override
  Transition<AppMode> onTap(TapGesture g) => switch (g.element) {
    MapTrip e => Transition.run<AppMode, Done>(
      FocusTrip(e.id),
      then: (_, _) => TripMode.open(e.id),
    ),
    _ => Transition.stay(),
  };

  static Transition<AppMode> selectTrip(MapTrip trip) =>
      Transition.set(selectionSlot, trip);
}
