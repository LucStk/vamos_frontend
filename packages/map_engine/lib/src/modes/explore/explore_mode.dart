import 'package:map_engine/src/gesture_engine/gesture_engine.dart';
import 'package:map_engine/src/mode_engine/mode_engine.dart';
import 'package:map_engine/src/modes/app_mode.dart';

import 'package:map_engine/src/domain/domain.dart';
import 'package:map_engine/src/modes/shared/slots/selection_slot.dart';
import 'package:map_engine/src/modes/shared/trip_mode.dart';

class ExploreMode extends AppMode {
  const ExploreMode();

  @override
  Set<Slot> get retainedSlots => const {selectionSlot};

  @override
  Transition onTap(TapGesture g) => switch (g.element) {
    // Le cadrage fait partie de l'ouverture : voir [TripMode.open].
    MapTrip e => TripMode.open(e.id, focus: true),
    _ => Transition.stay(),
  };

  static Transition selectTrip(MapTrip trip) =>
      Transition.set(selectionSlot, trip);
}
