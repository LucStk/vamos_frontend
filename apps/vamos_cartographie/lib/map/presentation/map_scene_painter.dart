import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_canvas/application/application.dart';

import 'package:vamos_cartographie/map/map.dart';
import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:map_canvas/domain/domain.dart';
import "test_point_painter.dart";

@Dependencies([mapScene, mapCameraSnapshot, MapCameraChanges])
class MapScenePaint extends ConsumerWidget {
  const MapScenePaint({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scene = ref.watch(mapSceneProvider);
    final commands = [
      for (final object in scene.objects.reversed)
        object.describe(
          context: MapPaintContext(
            state:
                (scene.selection != null) &&
                    scene.selection!.isSameAs(object.object)
                ? MapObjectVisualState.selected
                : MapObjectVisualState.normal,
          ),
        ),
    ];
    final size = ref.watch(mapCameraSnapshotProvider.select((c) => c.size));

    return CameraTransform(
      child: Stack(
        children: [
          RepaintBoundary(
            child: CustomPaint(
              size: size,
              painter: TestPointPainter(
                zoomScale: 100,
                offset: Offset(100, 100),
                radiusPx: 100,
              ),
            ),
          ),
          // World : jamais repeinte par la caméra
          RepaintBoundary(
            child: CustomPaint(size: size, painter: MapScenePainter(commands)),
          ),
          // Screen : repeinte uniquement quand le zoom change
          RepaintBoundary(
            child: _ScreenLayer(commands: commands, size: size),
          ),
        ],
      ),
    );
  }
}

@Dependencies([mapCameraSnapshot])
class _ScreenLayer extends ConsumerWidget {
  const _ScreenLayer({required this.commands, required this.size});
  final Iterable<MapDrawCommand> commands;
  final Size size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final zoom = ref.watch(
      mapCameraSnapshotProvider.select((c) => c.zoomScale),
    ); // ne change pas au pan
    return CustomPaint(size: size, painter: ScreenSpacePainter(commands, zoom));
  }
}

class MapScenePainter extends CustomPainter {
  const MapScenePainter(this.commands);
  final Iterable<MapDrawCommand> commands;

  @override
  void paint(Canvas canvas, Size size) {
    MapCommandRenderer(
      canvas: canvas,
      layer: MapRenderSpace.world,
    ).paintAll(commands);
  }

  @override
  bool shouldRepaint(MapScenePainter old) => !identical(commands, old.commands);
}

class ScreenSpacePainter extends CustomPainter {
  const ScreenSpacePainter(this.commands, this.zoomScale);
  final Iterable<MapDrawCommand> commands;
  final double zoomScale;

  @override
  void paint(Canvas canvas, Size size) {
    MapCommandRenderer(
      canvas: canvas,
      layer: MapRenderSpace.screen,
      zoomScale: zoomScale,
    ).paintAll(commands);
  }

  @override
  bool shouldRepaint(ScreenSpacePainter old) =>
      !identical(commands, old.commands) || zoomScale != old.zoomScale;
}
