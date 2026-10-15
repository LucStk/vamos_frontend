import 'package:domain_core/space/offset_type.dart';
import 'package:map_canvas/map_canvas.dart';
import 'package:map_engine/map_engine.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/map/mode/map_mode.dart';
import 'package:vamos_cartographie/map/scene/items/sketch_segment/pencil_item.dart';
import 'package:vamos_cartographie/map/scene/items/sketch_segment/sketch_segment_item.dart';

part 'sketch_item_provider.g.dart';

@Riverpod(keepAlive: true, dependencies: [])
PencilItem? pencilItem(Ref ref, MapCameraReader camera) {
  final sketchTrace = ref.watch(
    modeStateProvider.select((m) => m.slots.get(sketchTraceSlot)),
  );
  final pencilPosition = sketchTrace?.last;
  if (pencilPosition == null) return null;
  return PencilItem(object: MapSketchPencil(), worldPosition: pencilPosition);
}

@Riverpod(keepAlive: true, dependencies: [])
SketchSegmentItem? sketchTraceItem(Ref ref, MapCameraReader camera) {
  final sketchTrace = ref.watch(
    modeStateProvider.select((m) => m.slots.get(sketchTraceSlot)),
  );
  if (sketchTrace == null) return null;
  return SketchSegmentItem(
    object: MapSketchSegment(),
    worldSegments: projectLine<WorldOffset>(sketchTrace.points, (w) => w),
  );
}

@Riverpod(keepAlive: true, dependencies: [pencilItem, sketchTraceItem])
List<SceneItem> allSketchItem(Ref ref, MapCameraReader cameraReader) {
  final pencilItem = ref.watch(pencilItemProvider(cameraReader));
  final trace = ref.watch(sketchTraceItemProvider(cameraReader));
  return [?pencilItem, ?trace];
}
