import 'package:domain_core/space/offset_type.dart';
import 'package:map_canvas/map_canvas.dart';
import 'package:map_engine/map_engine.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip/trip.dart';
import 'package:vamos_cartographie/map/mode/map_mode.dart';
import 'package:vamos_cartographie/map/scene/items/sketch_segment/pencil_item.dart';
import 'package:vamos_cartographie/map/scene/items/sketch_segment/sketch_segment_item.dart';

part 'sketch_item_provider.g.dart';

// final projection = const Epsg3857().projection;

@Riverpod(keepAlive: true, dependencies: [])
List<SceneItem> sketchItem(
  Ref ref,
  TripId tripId,
  MapCameraReader cameraReader,
) {
  final List<SceneItem> ret = [];

  final sketchTrace = ref.watch(
    modeStateProvider.select((m) => m.slots.get(sketchTraceSlot)),
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
