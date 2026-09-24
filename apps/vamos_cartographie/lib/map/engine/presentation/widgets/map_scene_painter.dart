import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_canvas/application/application.dart';
import 'package:vamos_cartographie/map/engine/engine.dart';
import 'package:map_canvas/domain/domain.dart';
import 'package:flutter_riverpod/misc.dart';

class MapScenePaint extends ConsumerWidget {
  const MapScenePaint({super.key, required this.sceneProvider});
  final ProviderListenable<MapScene> sceneProvider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final commands = ref.watch(mapCommandsProvider(sceneProvider));
    final size = ref.watch(mapCameraSnapshotProvider.select((c) => c.size));

    return CameraTransform(
      child: Stack(
        children: [
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
