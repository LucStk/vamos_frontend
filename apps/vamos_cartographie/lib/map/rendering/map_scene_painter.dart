import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_canvas/map_canvas.dart';

import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/map/camera/map_camera_provider.dart';
import 'package:vamos_cartographie/map/rendering/animation/visual_transitions.dart';

class ScenePainter extends CustomPainter {
  ScenePainter({
    required this.items,
    required this.transitions,
    this.zoomScale, // null = passe invariante au zoom
  }) : super(repaint: transitions.ticks);

  final List<SceneItem> items;
  final VisualTransitions transitions;
  final double? zoomScale;

  @override
  void paint(Canvas canvas, Size size) {
    final renderer = zoomScale == null
        ? MapCommandRenderer.zoomInvariant(canvas)
        : MapCommandRenderer.zoomDependent(canvas, zoomScale: zoomScale!);
    renderer.paintAll(transitions.commandsFor(items));
  }

  @override
  bool shouldRepaint(ScenePainter old) =>
      !identical(items, old.items) || zoomScale != old.zoomScale;
}

@Dependencies([mapCameraSnapshot])
class SceneLayer extends ConsumerWidget {
  const SceneLayer({
    super.key,
    required this.items,
    required this.transitions,
    required this.size,
  });

  final List<SceneItem> items;
  final VisualTransitions transitions;
  final Size size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final zoom = ref.watch(
      mapCameraSnapshotProvider.select((c) => c.zoomScale),
    );
    return Stack(
      children: [
        RepaintBoundary(
          child: CustomPaint(
            size: size,
            painter: ScenePainter(items: items, transitions: transitions),
          ),
        ),
        RepaintBoundary(
          child: CustomPaint(
            size: size,
            painter: ScenePainter(
              items: items,
              transitions: transitions,
              zoomScale: zoom,
            ),
          ),
        ),
      ],
    );
  }
}
