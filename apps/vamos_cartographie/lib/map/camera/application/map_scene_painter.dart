import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_canvas/application/map_command_renderer.dart';
import 'package:map_canvas/application/projected_object.dart';
import 'package:map_canvas/domain/map_paint_context.dart';
import 'package:vamos_cartographie/map/camera/application/transition_hub.dart';
import 'package:vamos_cartographie/map/camera/injection/map_camera_provider.dart';

import 'package:riverpod_annotation/experimental/scope.dart';

class MapScenePainter extends CustomPainter {
  MapScenePainter({required this.objects, required this.visuals});

  final Iterable<ProjectedObject> objects;
  final Map<Object, VisualState> visuals;

  @override
  void paint(Canvas canvas, Size size) {
    final commands = [
      for (final object in objects.toList().reversed)
        object.describe(
          context:
              (visuals[object.object] ??
                      VisualState(MapObjectVisualState.normal))
                  .contextFor(),
        ),
    ];
    MapCommandRenderer(
      canvas: canvas,
      layer: MapRenderSpace.world,
    ).paintAll(commands);
  }

  @override
  bool shouldRepaint(MapScenePainter old) => !identical(objects, old.objects);
}

@Dependencies([mapCameraSnapshot])
class ScreenLayer extends ConsumerWidget {
  const ScreenLayer({
    super.key,
    required this.objects,
    required this.visuals,
    required this.repaint,
    required this.size,
  });

  final Iterable<ProjectedObject> objects;
  final Map<Object, VisualState> visuals;
  final Listenable repaint;
  final Size size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final zoom = ref.watch(
      mapCameraSnapshotProvider.select((c) => c.zoomScale),
    );
    return CustomPaint(
      size: size,
      painter: ScreenSpacePainter(
        objects: objects,
        visuals: visuals,
        zoomScale: zoom,
        repaint: repaint,
      ),
    );
  }
}

class ScreenSpacePainter extends CustomPainter {
  ScreenSpacePainter({
    required this.objects,
    required this.visuals,
    required this.zoomScale,
    required Listenable repaint,
  }) : super(repaint: repaint); // <-- même instance de hub à chaque build

  final Iterable<ProjectedObject> objects;
  final Map<Object, VisualState> visuals;
  final double zoomScale;

  @override
  void paint(Canvas canvas, Size size) {
    final commands = [
      for (final object in objects.toList().reversed)
        object.describe(
          context:
              (visuals[object.object] ??
                      VisualState(MapObjectVisualState.normal))
                  .contextFor(),
        ),
    ];
    MapCommandRenderer(
      canvas: canvas,
      layer: MapRenderSpace.screen,
      zoomScale: zoomScale,
    ).paintAll(commands);
  }

  @override
  bool shouldRepaint(ScreenSpacePainter old) =>
      !identical(objects, old.objects) || zoomScale != old.zoomScale;
}
