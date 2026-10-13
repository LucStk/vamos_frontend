import 'package:map_engine/src/domain/gestures/map_gesture.dart';
import 'package:map_engine/src/domain/objects/map_objects.dart';
import 'package:map_engine/src/domain/selection.dart';
import 'package:map_engine/src/mode_machine/mode.dart';
import 'package:map_engine/src/mode_machine/slot.dart';
import 'package:map_engine/src/mode_machine/transition.dart';
import 'package:trip_application/trip_application.dart';

class MapExploreMode extends Mode<MapExploreMode> {
  const MapExploreMode();

  @override
  Set<Slot> get retainedSlots => const {selectionSlot};

  @override
  Transition<MapExploreMode> onTap(TapGesture g) => switch (g.element) {
    // MapTrip e => Transition.run(FocusTrip(e)).and(selectionSlot, e),
    _ => Transition.stay(),
  };

  static Transition<MapExploreMode> selectTrip(TripId tripId) =>
      Transition.set(selectionSlot, MapTrip(tripId));
}
