import 'package:map_canvas/map_canvas.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/map/scene/map_scene.dart';

part 'visual_target.g.dart';

@Riverpod(dependencies: [])
Map<Object, MapObjectVisualState> visualTargets(Ref ref) {
  final scene = ref.watch(mapSceneProvider);
  return {
    for (final item in scene.items)
      item.object: scene.visualStateOf(item.object),
  };
}
