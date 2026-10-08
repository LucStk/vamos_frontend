// modes/trip_editor/selection_actions.dart
import 'package:latlong2/latlong.dart';
import 'package:trip_application/trip_application.dart';

import '../../domain/selection.dart';
import '../../mode_machine/gesture_result.dart';
import 'map_editor_command.dart';
import 'map_editor_mode.dart';

extension VertexSelectionActions on VertexSelection {
  GestureResult<MapEditorMode> delete() => GestureResult.run(
    RemoveVertex(id),
    then: (_, _) => GestureResult.set(selectionSlot, null),
  );

  GestureResult<MapEditorMode> createWaypoint() =>
      GestureResult.run(CreateWaypointFromVertex(id));

  GestureResult<MapEditorMode> startSketch(LatLng position) => GestureResult.to(
    SketchCreation(
      vertexStart: id,
      path: [position],
      mobilityType: MobilityType.bike,
    ),
  );
}

extension SegmentSelectionActions on SegmentSelection {
  GestureResult<MapEditorMode> delete() => GestureResult.run(
    DeleteSegment(id),
    then: (_, _) => GestureResult.set(selectionSlot, null),
  );

  GestureResult<MapEditorMode> startEdit() =>
      GestureResult.to(SketchEdition(segmentId: id, path: []));
}
