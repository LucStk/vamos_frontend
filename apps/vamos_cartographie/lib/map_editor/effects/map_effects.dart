// L'EffectRunner connaît le store, pas le reducer.
import 'package:domain_core/domain/collection_store.dart';
import 'package:flutter/painting.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_engine/domain/domain.dart';
import 'package:map_engine/map_camera_controller.dart';
import 'package:map_engine/utiles/merge_polyline.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map_editor/domain/domain.dart';
part "segment_effects.dart";
part "vertex_effects.dart";
part "camera_effects.dart";

class MapEffectContext {
  const MapEffectContext({
    required this.graphEditor,
    required this.waypointEditor,
    required this.mapState,
    required this.camera,
  });

  final GraphEditor graphEditor;
  final WaypointEditor waypointEditor;
  final MapEditorState mapState;
  final MapCameraController camera;
}

sealed class MapEffect {
  const MapEffect();

  Future<MapEditorState?> resolver(MapEffectContext context);
}
