import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';
import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/map/camera/map_camera_provider.dart';
import 'package:vamos_cartographie/map/interaction/mode_machine.dart';
import 'package:vamos_cartographie/map/interaction/visual_target.dart';
import 'package:vamos_cartographie/map/rendering/animation/visual_transitions.dart';
import 'package:vamos_cartographie/map/rendering/map_scene_painter.dart';
import 'package:vamos_cartographie/map/scene/map_scene.dart';
import 'package:vamos_cartographie/map/ui/shared/camera/camera_transform_widget.dart';

@Dependencies([mapScene, visualTargets, mapMode])
class MapScenePaint extends ConsumerStatefulWidget {
  const MapScenePaint({super.key});

  @override
  ConsumerState<MapScenePaint> createState() => _MapScenePaintState();
}

class _MapScenePaintState extends ConsumerState<MapScenePaint>
    with SingleTickerProviderStateMixin {
  late final VisualTransitions _transitions;

  bool _generating = false;
  bool _reduceMotion = false;

  /// La boucle ne tourne que pendant une génération, et seulement si
  /// l'utilisateur n'a pas demandé de réduire les animations.
  void _sync() => _transitions.looping = _generating && !_reduceMotion;

  @override
  void initState() {
    super.initState();
    _transitions = VisualTransitions(this)
      ..setTargets(
        ref.read(visualTargetsProvider),
      ); // premier rendu : sans animation
    _generating = ref.read(mapModeProvider) is SketchGenerating;
    _sync();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Appelé après initState, puis à chaque changement du réglage système.
    _reduceMotion = MediaQuery.disableAnimationsOf(context);
    _sync();
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
    ref.listen(mapModeProvider.select((m) => m is SketchGenerating), (_, on) {
      _generating = on;
      _sync();
    });

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
