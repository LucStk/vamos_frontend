// modes/trip_editor/selection_actions.dart
import 'package:map_engine/src/domain/objects/map_objects.dart';
import 'package:map_engine/src/mode_machine/command/waypoint_command.dart';
import 'package:map_engine/src/mode_machine/modes/app_mode.dart';
import 'package:map_engine/src/mode_machine/slots/selection_slot.dart';
import 'package:map_engine/src/mode_machine/transition.dart';

extension SelectableDelete on Selectable {
  Transition<AppMode> delete() => switch (this) {
    MapWaypoint waypoint => waypoint.delete().closingOverlay(),
    MapSegment segment => segment.delete().closingOverlay(),
    _ => Transition.stay(),
  };
}

extension WaypointSelectionActions on MapWaypoint {
  Transition<AppMode> delete() => Transition.run(
    RemoveWaypoint(tripId: tripId, waypointId: id),
    then: (_, _) => Transition.set(selectionSlot, null),
  );
}
//
// extension SegmentSelectionActions on MapSegment {
//   Transition<AppMode> delete() => Transition.stay(); //Transition.run(
//   //     DeleteSegment(id),
//   //     then: (_, _) => Transition.set(selectionSlot, null),
//   //   );
//   //
//   Transition<AppMode> startEdit() =>
//       Transition.to(SketchEdition(tripId, segmentId: id));
// }
