import 'package:map_engine/src/mode_machine/modes/app_mode.dart';
import 'package:map_engine/src/mode_machine/slots/selection_slot.dart';
import 'package:map_engine/src/mode_machine/slots/slot.dart';
import 'package:trip_application/trip_application.dart';

abstract class TripMode extends AppMode {
  const TripMode(this.tripId);
  final TripId tripId;
  @override
  Set<Slot> get retainedSlots => const {selectionSlot};

  //   @override
  //   Transition<AppMode> onTap(TapGesture g) => switch (g.element) {
  //     MapWaypoint e => Transition.overlay(WaypointMenu(e)).and(selectionSlot, e),
  //     MapSegment e => Transition.set(selectionSlot, e),
  //
  //     // Tap dans le vide : d'abord on désélectionne, ensuite seulement on sort.
  //     null => Transition.withState<AppMode>(
  //       (st) => st.slots.get(selectionSlot) == null
  //           ? Transition.run<AppMode, Done>(
  //               CameraBack(),
  //               then: (_, _) => Transition.to<AppMode>(const ExploreMode()),
  //             )
  //           : Transition.set(selectionSlot, null),
  //     ),
  //
  //     _ => Transition.stay(),
  //   };
}
