import 'package:map_canvas/map_canvas.dart';
import 'package:map_engine/map_engine.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip/trip.dart';

import '../../../camera/injection/camera_or_null.dart';
import '../application/projected_sketch_pencil.dart';
import '../application/projected_sketch_segment.dart';
import 'map_editor_mode.dart';
part 'sketch_elements_projecter.g.dart';

// final projection = const Epsg3857().projection;

@Riverpod(dependencies: [CameraOrNull, MapEditor])
List<ProjectedObject> sketchElementProjection(Ref ref, TripId tripId) {
  final List<ProjectedObject> ret = [];

  final editorMode = ref.watch(mapEditorProvider(tripId));
  final cameraReader = ref.watch(cameraOrNullProvider);
  if (cameraReader == null) {
    return [];
  }

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
          worldSegments: projectLine(
            sketch.path,
            cameraReader.latLngToWorldOffset,
          ),
        ),
      );
    }
  }
  return ret;
}
