import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/map/camera/map_camera_provider.dart';
import 'package:vamos_cartographie/map/interaction/visual_target.dart';
import 'package:vamos_cartographie/map/rendering/animation/visual_transitions.dart';
import 'package:vamos_cartographie/map/rendering/map_scene_painter.dart';
import 'package:vamos_cartographie/map/scene/map_scene.dart';
import 'package:vamos_cartographie/map/ui/shared/camera/camera_transform_widget.dart';

@Dependencies([mapScene, visualTargets, mapCamera])
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

    final camera = ref.watch(mapCameraProvider);
    final items = ref.watch(mapSceneProvider.select((s) => s.items));

    return CameraTransform(
      // Seule la taille de la carte est suivie ici : le pan, le zoom et la
      // rotation sont gérés par CameraTransform, sans reconstruire la scène.
      child: ValueListenableBuilder<Size>(
        valueListenable: camera.sizeListenable,
        builder: (context, size, _) => SceneLayer(
          items: items,
          transitions: _transitions,
          zoomScale: camera.zoomScaleListenable,
          size: size,
        ),
      ),
    );
  }
}
