import 'package:map_engine/src/domain/gestures/map_gesture.dart';
import 'package:map_engine/src/domain/objects/map_objects.dart';
import 'package:map_engine/src/mode_machine/command/effect/results.dart';
import 'package:map_engine/src/mode_machine/command/explore_command.dart';
import 'package:map_engine/src/mode_machine/modes/app_mode.dart';
import 'package:map_engine/src/mode_machine/modes/edit_trip/trip_edit_mode.dart';
import 'package:map_engine/src/mode_machine/modes/explore/trip_read_only_mode.dart';
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
      then: (_, _) => Transition.to<AppMode>(
        e.isOwned ? TripActiveMode(e.id) : TripReadOnlyMode(e.id),
      ),
    ),
    _ => Transition.stay(),
  };

  static Transition<AppMode> selectTrip(MapTrip trip) =>
      Transition.set(selectionSlot, trip);

  static Transition<AppMode> switchTo() => Transition.to(ExploreMode());
}
