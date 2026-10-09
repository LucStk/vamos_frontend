// modes/trip_editor/selection_actions.dart
import 'package:latlong2/latlong.dart';
import 'package:trip_application/trip_application.dart';

import '../../domain/selection.dart';
import '../../mode_machine/transition.dart';
import 'map_editor_command.dart';
import 'map_editor_mode.dart';

extension VertexSelectionActions on VertexSelection {
  Transition<MapEditorMode> delete() => Transition.run(
    RemoveVertex(id),
    then: (_, _) => Transition.set(selectionSlot, null),
  );

  Transition<MapEditorMode> createWaypoint() =>
      Transition.run(CreateWaypointFromVertex(id));

  Transition<MapEditorMode> startSketch(LatLng position) => Transition.to(
    SketchCreation(
      vertexStart: id,
      path: [position],
      mobilityType: MobilityType.bike,
    ),
  );
}

extension SegmentSelectionActions on SegmentSelection {
  Transition<MapEditorMode> delete() => Transition.run(
    DeleteSegment(id),
    then: (_, _) => Transition.set(selectionSlot, null),
  );

  Transition<MapEditorMode> startEdit() =>
      Transition.to(SketchEdition(segmentId: id, path: []));
}
