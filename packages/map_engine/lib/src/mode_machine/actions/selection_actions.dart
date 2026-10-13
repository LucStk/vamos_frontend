// modes/trip_editor/selection_actions.dart
import 'package:latlong2/latlong.dart';
import 'package:map_engine/src/domain/objects/map_objects.dart';
import 'package:map_engine/src/domain/selection.dart';
import 'package:map_engine/src/mode_machine/command/segment_command.dart';
import 'package:map_engine/src/mode_machine/command/vertex_command.dart';
import 'package:map_engine/src/mode_machine/command/waypoint_command.dart';
import 'package:map_engine/src/mode_machine/modes/trip_edit_mode.dart';
import 'package:map_engine/src/mode_machine/transition.dart';

extension SelectableDelete on Selectable {
  Transition<TripEditMode> delete() => switch (this) {
    MapVertex vertex => vertex.delete(),
    MapSegment segment => segment.delete(),
    _ => Transition.stay(),
  };
}

extension VertexSelectionActions on MapVertex {
  Transition<TripEditMode> delete() => Transition.run(
    RemoveVertex(id),
    then: (_, _) => Transition.set(selectionSlot, null),
  );

  Transition<TripEditMode> createWaypoint() =>
      Transition.run(CreateWaypointFromVertex(id));

  Transition<TripEditMode> startSketch(LatLng position) =>
      Transition.to(SketchCreation());
}

extension SegmentSelectionActions on MapSegment {
  Transition<TripEditMode> delete() => Transition.run(
    DeleteSegment(id),
    then: (_, _) => Transition.set(selectionSlot, null),
  );

  Transition<TripEditMode> startEdit() =>
      Transition.to(SketchEdition(segmentId: id));
}
