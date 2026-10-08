import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_canvas/map_canvas.dart';

import 'package:riverpod_annotation/experimental/scope.dart';

import '../../injection/map_scene.dart';
import '../injection/map_camera_provider.dart';
import '../presentation/presentation.dart';
import 'map_scene_painter.dart';
import 'transition_hub.dart';

@Dependencies([mapScene, mapCameraSnapshot])
class MapScenePaint extends ConsumerStatefulWidget {
  const MapScenePaint({super.key});

  @override
  ConsumerState<MapScenePaint> createState() => _MapScenePaintState();
}

class _MapScenePaintState extends ConsumerState<MapScenePaint>
    with TickerProviderStateMixin {
  // TickerProviderStateMixin (pas Single) : plusieurs controllers en //.
  static const _transitionDuration = Duration(milliseconds: 100);

  final _repaintHub = TransitionHub();
  final Map<Object, VisualState> _visuals = {};

  @override
  void dispose() {
    for (final v in _visuals.values) {
      v.controller?.removeListener(_repaintHub.pulse);
      v.controller?.dispose();
    }
    _repaintHub.dispose();
    super.dispose();
  }

  MapObjectVisualState _computeState(ProjectedObject object, MapScene scene) {
    if (scene.dragging != null && scene.dragging!.isSameAs(object.object)) {
      return MapObjectVisualState.dragging;
    }
    if (scene.selection != null && scene.selection!.concerns(object.object)) {
      return MapObjectVisualState.selected;
    }
    if (scene.hovered != null && scene.hovered!.isSameAs(object.object)) {
      return MapObjectVisualState.hovered;
    }
    return MapObjectVisualState.normal;
  }

  /// Clé stable pour indexer _visuals. À adapter : voir la note plus bas
  /// sur isSameAs vs ==.
  Object _keyOf(ProjectedObject object) => object.object;

  void _syncVisuals(Iterable<ProjectedObject> objects, MapScene scene) {
    final present = <Object>{};

    for (final object in objects) {
      final key = _keyOf(object);
      present.add(key);
      final newState = _computeState(object, scene);
      final visual = _visuals[key];

      if (visual == null) {
        _visuals[key] = VisualState(newState); // 1er rendu : pas d'anim
        continue;
      }

      if (visual.state != newState) {
        visual.from = visual.state;
        visual.state = newState;
        final controller = visual.controller ??= (AnimationController(
          vsync: this,
          duration: _transitionDuration,
        )..addListener(_repaintHub.pulse));
        controller.forward(from: 0);
      }
    }

    // Objet supprimé de la scène -> plus dessiné, on libère son controller
    // tout de suite (pas besoin d'attendre isCompleted, rien ne l'affiche).
    _visuals.removeWhere((key, visual) {
      if (present.contains(key)) return false;
      visual.controller?.removeListener(_repaintHub.pulse);
      visual.controller?.dispose();
      return true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final scene = ref.watch(mapSceneProvider);
    final size = ref.watch(mapCameraSnapshotProvider.select((c) => c.size));

    _syncVisuals(
      scene.objects,
      scene,
    ); // discret : appelé au build, pas au tick

    return CameraTransform(
      child: Stack(
        children: [
          RepaintBoundary(child: CustomPaint(size: size)),
          RepaintBoundary(
            child: CustomPaint(
              size: size,
              painter: MapScenePainter(
                objects: scene.objects,
                visuals: _visuals,
              ),
            ),
          ),
          RepaintBoundary(
            child: ScreenLayer(
              objects: scene.objects,
              visuals: _visuals,
              repaint: _repaintHub,
              size: size,
            ),
          ),
        ],
      ),
    );
  }
}
