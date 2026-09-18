import 'package:map_engine/map_engine.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip/trip.dart';
import 'package:vamos_cartographie/trip_map/editor/injection/editor_controller_provider.dart';
import "package:map_application/map_application.dart";

import 'package:vamos_cartographie/base_map/base_map.dart';
part 'sketch_elements_projecter.g.dart';

// final projection = const Epsg3857().projection;

@riverpod
List<ProjectedObject> sketchElementProjection(Ref ref, TripId tripId) {
  final List<ProjectedObject> ret = [];

  final editorMode = ref.watch(editorModeProvider(tripId));
  final cameraReader = ref.read(mapCameraHolderProvider);

  if (editorMode case final SketchMode sketch) {
    final position = sketch.pencilPositionOrNull;
    if (position != null) {
      ret.add(
        ProjectedSketchPencil(
          object: MapSketchPencil(position),
          worldPosition: cameraReader.latLngToWorldOffset(position),
        ),
      );
      ret.add(
        ProjectedSketchSegment(
          object: MapSketchSegment(sketch.path),
          worldPoints: sketch.path
              .map((p) => cameraReader.latLngToWorldOffset(p))
              .toList(),
        ),
      );
    }
  }
  return ret;
}
