import 'package:map_engine/map_engine.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/map/interaction/mode_machine.dart';
import 'package:vamos_cartographie/map/modes/sketch_mode/scene/pencil_item.dart';

part 'pencil_item_provider.g.dart';

@Riverpod(keepAlive: true, dependencies: [modeSlot])
PencilItem? pencilItem(Ref ref, MapCameraReader camera) {
  final sketchTrace = ref.watch(modeSlotProvider(sketchTraceSlot));
  final pencilPosition = sketchTrace?.tip;
  if (pencilPosition == null) return null;
  return PencilItem(object: MapSketchPencil(), worldPosition: pencilPosition);
}
