import 'package:map_canvas/map_canvas.dart';
import 'package:map_engine/map_engine.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/map/scene/layers/sketch/pencil_item_provider.dart';
import 'package:vamos_cartographie/map/scene/layers/sketch/sketch_trace_item_provider.dart';

part 'sketch_layer.g.dart';

@Riverpod(keepAlive: true, dependencies: [pencilItem, sketchTraceItem])
List<SceneItem> allSketchItem(Ref ref, MapCameraReader cameraReader) {
  final pencilItem = ref.watch(pencilItemProvider(cameraReader));
  final trace = ref.watch(sketchTraceItemProvider(cameraReader));
  return [?pencilItem, ?trace];
}
