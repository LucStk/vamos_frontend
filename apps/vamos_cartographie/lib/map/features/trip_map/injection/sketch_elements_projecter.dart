import 'package:map_canvas/application/projection/projected_sketch_pencil.dart';
import 'package:map_canvas/application/projection/projected_sketch_segment.dart';
import 'package:map_canvas/domain/projected_base_object/projected_object.dart';
import 'package:map_engine/map_engine.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip/trip.dart';

import 'package:map_editor_application/map_editor.dart';
import 'package:vamos_cartographie/map/map.dart';
part 'sketch_elements_projecter.g.dart';

// final projection = const Epsg3857().projection;

@Riverpod(dependencies: [mapCamera])
List<ProjectedObject> sketchElementProjection(Ref ref, TripId tripId) {
  final List<ProjectedObject> ret = [];

  final editorMode = ref.watch(mapEditorProvider(tripId));
  final cameraReader = ref.read(mapCameraProvider);

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
