import 'package:map_canvas/map_canvas.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../injection/map_scene.dart';

part 'visual_target.g.dart';

@Riverpod(dependencies: [mapScene])
Map<Object, MapObjectVisualState> visualTargets(Ref ref) {
  final scene = ref.watch(mapSceneProvider);
  return {
    for (final item in scene.items)
      item.object.stableId: scene.visualStateOf(item.object),
  };
}
