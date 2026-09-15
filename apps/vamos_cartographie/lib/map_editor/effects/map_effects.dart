// L'EffectRunner connaît le store, pas le reducer.
import 'package:domain_core/domain/collection_store.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_engine/domain/domain.dart';
import 'package:map_engine/map_camera_controller.dart';
import 'package:map_engine/utiles/merge_polyline.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map_editor/domain/domain.dart';
part "segment_effects.dart";
part "vertex_effects.dart";

mixin MapEffects {
  WaypointEditor get waypointEditor;
  GraphEditor get graphEditor;
  MapCameraController? get cameraController;
  MapEditorState get mapState;
  set mapState(MapEditorState value);
}
