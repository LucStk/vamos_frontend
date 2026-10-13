import 'package:map_canvas/map_canvas.dart';
import 'package:map_engine/map_engine.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip/trip.dart';

import '../../../canvas/domain/scene_item/sketch_segment/sketch_segment_item.dart';
import '/map/canvas/domain/scene_item/pencil_item.dart';
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

  final sketchTrace = ref.watch(
    mapEditorProvider(tripId).select((m) => m.slots.get(sketchTraceSlot)),
  );

  if (sketchTrace != null) {
    final pencilPosition = sketchTrace.last;
    if (pencilPosition != null) {
      ret.add(
        PencilItem(object: MapSketchPencil(), worldPosition: pencilPosition),
      );
      ret.add(
        SketchSegmentItem(
          object: MapSketchSegment(),
          worldSegments: projectLine<WorldOffset>(sketchTrace.points, (w) => w),
        ),
      );
    }
  }
  return ret;
}
