import 'package:domain_core/space/offset_type.dart';
import 'package:map_engine/map_engine.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/map/interaction/mode_machine.dart';
import 'package:vamos_cartographie/map/modes/sketch_mode/scene/sketch_segment_item.dart';

part 'sketch_trace_item_provider.g.dart';

@Riverpod(keepAlive: true, dependencies: [modeSlot])
SketchSegmentItem? sketchTraceItem(
  Ref ref,
  bool pending,
  MapCameraReader camera,
) {
  final sketchTrace = ref.watch(modeSlotProvider(sketchTraceSlot));
  if (sketchTrace == null) return null;
  return SketchSegmentItem(
    object: MapSketchSegment(),
    worldSegments: projectLine<WorldOffset>(sketchTrace.points, (w) => w),
    pending: pending,
  );
}
