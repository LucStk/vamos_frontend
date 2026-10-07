import 'package:latlong2/latlong.dart';

import '../../../map_editor_command.dart';
import '/src/mode_machine/gesture_result.dart';
import '../../../map_editor_mode.dart';

abstract final class IdleEditorIntents {
  static GestureResult<MapEditorMode> createVertex(LatLng position) =>
      GestureResult.run(CreateSimpleVertex(position));

  static GestureResult<MapEditorMode> createWaypoint(LatLng position) =>
      GestureResult.run(CreateWaypointFromPosition(position));
}
