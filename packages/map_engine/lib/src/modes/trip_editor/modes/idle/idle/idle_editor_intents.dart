import 'package:latlong2/latlong.dart';
import 'package:trip_application/trip_application.dart';
import '/src/modes/trip_editor/map_editor_command.dart';
import '/src/mode_machine/gesture_result.dart';
import '../../../map_editor_mode.dart';

abstract final class IdleEditorIntents {
  static GestureResult<MapEditorMode> createVertex(LatLng position) =>
      GestureResult.run(
        CreateSimpleVertex(position),
        then: (current, VertexId id) => current is IdleEditor
            ? GestureResult.to(VertexSelectMode(vertexId: id))
            : null,
      );
  // createWaypoint inchangé
  static GestureResult<MapEditorMode> createWaypoint(LatLng position) =>
      GestureResult.run(CreateWaypointFromPosition(position));
}
