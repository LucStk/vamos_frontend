// L'EffectRunner connaît le store, pas le reducer.
import 'package:latlong2/latlong.dart';
import 'package:map_application/domain/domain.dart';
import 'package:map_application/editor/editor.dart';
import 'map_camera_controller.dart';
import 'package:trip_application/trip_application.dart';
part "segment_effects.dart";
part "vertex_effects.dart";

abstract class MapEffects {
  final WaypointEditor waypointEditor;
  final GraphEditor graphEditor;
  final MapCameraController cameraController;
  const MapEffects({
    required this.graphEditor,
    required this.waypointEditor,
    required this.cameraController,
  });
  MapEditorState get mapState;
  set mapState(MapEditorState value);
}
