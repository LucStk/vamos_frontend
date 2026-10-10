import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/experimental/scope.dart';

import '../../camera/injection/map_camera_provider.dart';
import '../../camera/presentation/camera_transform_widget.dart';
import '../../injection/map_scene.dart';
import '../application/visual_transitions.dart';
import '../injection/visual_target.dart';
import 'map_scene_painter.dart';

@Dependencies([mapScene, visualTargets, mapCameraSnapshot])
class MapScenePaint extends ConsumerStatefulWidget {
  const MapScenePaint({super.key});

  @override
  ConsumerState<MapScenePaint> createState() => _MapScenePaintState();
}

class _MapScenePaintState extends ConsumerState<MapScenePaint>
    with SingleTickerProviderStateMixin {
  late final VisualTransitions _transitions;

  @override
  void initState() {
    super.initState();
    _transitions = VisualTransitions(this)
      ..setTargets(
        ref.read(visualTargetsProvider),
      ); // premier rendu : sans animation
  }

  @override
  void dispose() {
    _transitions.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      visualTargetsProvider,
      (_, next) => _transitions.setTargets(next),
    );

    final items = ref.watch(mapSceneProvider.select((s) => s.items));
    final size = ref.watch(mapCameraSnapshotProvider.select((c) => c.size));

    return CameraTransform(
      child: SceneLayer(items: items, transitions: _transitions, size: size),
    );
  }
}
