import 'package:map_canvas/map_canvas.dart';
import 'package:map_engine/map_engine.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/map/mode_machine/map_mode.dart';
import 'package:vamos_cartographie/map/modes/sketch_mode/providers/pencil_item_provider.dart';
import 'package:vamos_cartographie/map/modes/sketch_mode/providers/sketch_trace_item_provider.dart';

part 'sketch_layer.g.dart';

@Riverpod(keepAlive: true, dependencies: [mapMode, pencilItem, sketchTraceItem])
List<SceneItem> allSketchItem(Ref ref, MapCameraReader cameraReader) {
  // Pendant la génération, le crayon disparaît : plus rien à saisir,
  // et la trace seule porte l'animation d'attente.
  final generating = ref.watch(
    mapModeProvider.select((m) => m is SketchGenerating),
  );

  final pencilItem = generating
      ? null
      : ref.watch(pencilItemProvider(cameraReader));
  final trace = ref.watch(sketchTraceItemProvider(cameraReader));

  return [?pencilItem, ?trace];
}
