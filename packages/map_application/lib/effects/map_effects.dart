// L'EffectRunner connaît le store, pas le reducer.
import 'package:latlong2/latlong.dart';
import 'package:map_application/editor/editor.dart';
import 'package:map_application/editor/segment_editor.dart';
import 'package:map_application/editor/waypoint_editor.dart';
import 'package:trip_application/trip_application.dart';
part "segment_effects.dart";
part "vertex_effects.dart";

sealed class MapEffect {
  const MapEffect();

  Future<void> run(MapEditor context);
}
