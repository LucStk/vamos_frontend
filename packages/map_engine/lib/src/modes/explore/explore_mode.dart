import 'package:map_engine/src/domain/objects/map_objects.dart';
import 'package:map_engine/src/gesture_engine/gesture_engine.dart';
import 'package:map_engine/src/mode_engine/mode_engine.dart';
import 'package:map_engine/src/modes/app_mode.dart';

import 'package:map_engine/src/modes/explore/commands/explore_command.dart';
import 'package:map_engine/src/modes/shared/slots/selection_slot.dart';
import 'package:map_engine/src/modes/shared/trip_mode.dart';

class ExploreMode extends AppMode {
  const ExploreMode();

  @override
  Set<Slot> get retainedSlots => const {selectionSlot};

  @override
  Transition onTap(TapGesture g) => switch (g.element) {
    MapTrip e => Transition.run<Done>(
      FocusTrip(e.id),
      then: (_, _) => TripMode.open(e.id),
    ),
    _ => Transition.stay(),
  };

  static Transition selectTrip(MapTrip trip) =>
      Transition.set(selectionSlot, trip);
}
