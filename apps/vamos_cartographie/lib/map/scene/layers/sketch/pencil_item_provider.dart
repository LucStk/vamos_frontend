import 'package:map_engine/map_engine.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/map/mode/map_mode.dart';
import 'package:vamos_cartographie/map/scene/items/sketch_segment/pencil_item.dart';

part 'pencil_item_provider.g.dart';

@Riverpod(keepAlive: true, dependencies: [])
PencilItem? pencilItem(Ref ref, MapCameraReader camera) {
  final sketchTrace = ref.watch(
    modeStateProvider.select((m) => m.slots.get(sketchTraceSlot)),
  );
  final pencilPosition = sketchTrace?.last;
  if (pencilPosition == null) return null;
  return PencilItem(object: MapSketchPencil(), worldPosition: pencilPosition);
}
