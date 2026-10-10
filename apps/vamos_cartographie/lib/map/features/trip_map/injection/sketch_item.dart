import 'package:map_canvas/map_canvas.dart';
import 'package:map_engine/map_engine.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip/trip.dart';

import '/map/canvas/domain/scene_item/pencil_item.dart';
import '/map/canvas/domain/scene_item/sketch_segment_item.dart';
import 'map_editor_mode.dart';
part 'sketch_item.g.dart';

// final projection = const Epsg3857().projection;

@Riverpod(dependencies: [MapEditor])
List<SceneItem> sketchItem(
  Ref ref,
  TripId tripId,
  MapCameraReader cameraReader,
) {
  final List<SceneItem> ret = [];

  final editorMode = ref.watch(mapEditorProvider(tripId).select((m) => m.mode));

  if (editorMode case final SketchMode sketch) {
    final position = sketch.pencilPositionOrNull;
    if (position != null) {
      ret.add(
        PencilItem(
          object: MapSketchPencil(position),
          worldPosition: cameraReader.latLngToWorldOffset(position),
        ),
      );
      ret.add(
        SketchSegmentItem(
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
