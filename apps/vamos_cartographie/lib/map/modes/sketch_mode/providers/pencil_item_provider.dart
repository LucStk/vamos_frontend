import 'package:map_canvas/map_canvas.dart';
import 'package:map_engine/map_engine.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/map/interaction/mode_machine.dart';
import 'package:vamos_cartographie/map/modes/sketch_mode/scene/pencil_anchore_item.dart';
import 'package:vamos_cartographie/map/modes/sketch_mode/scene/pencil_item.dart';

part 'pencil_item_provider.g.dart';

@Riverpod(keepAlive: true, dependencies: [modeSlot])
SceneItem? pencilItem(Ref ref, MapCameraReader camera) {
  final sketchTrace = ref.watch(modeSlotProvider(sketchTraceSlot));
  final pencilPosition = sketchTrace?.tip;
  if (pencilPosition == null) return null;
  if (sketchTrace?.endAnchor != null) {
    return PencilAnchoreItem(worldPosition: pencilPosition);
  }
  return PencilItem(worldPosition: pencilPosition);
}
