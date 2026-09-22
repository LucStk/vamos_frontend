import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_canvas/camera_transform_widget.dart';
import 'package:map_engine/map_engine.dart';
import 'package:flutter_riverpod/misc.dart';

class MapScenePaint extends ConsumerWidget {
  const MapScenePaint({
    super.key,
    required this.sceneProvider,
    required this.mapCameraReader,
  });

  final ProviderListenable<MapScene> sceneProvider;
  final MapCameraReader mapCameraReader;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scene = ref.watch(sceneProvider);

    return Stack(
      children: [
        RepaintBoundary(
          child: CameraTransform(
            camera: mapCameraReader,
            child: CustomPaint(
              size: mapCameraReader.size,
              painter: MapScenePainter(scene.worldCommands),
            ),
          ),
        ),
        RepaintBoundary(
          child: CustomPaint(
            size: mapCameraReader.size,
            painter: ScreenSpacePainter(scene.screenCommands, mapCameraReader),
          ),
        ),
      ],
    );
  }
}

class MapScenePainter extends CustomPainter {
  const MapScenePainter(this.commands);

  final Iterable<MapDrawCommand> commands;

  @override
  void paint(Canvas canvas, Size size) {
    MapCommandRenderer(canvas: canvas).paintAll(commands);
  }

  @override
  bool shouldRepaint(MapScenePainter oldDelegate) {
    return !identical(commands, oldDelegate.commands);
  }
}

class ScreenSpacePainter extends CustomPainter {
  const ScreenSpacePainter(this.commands, this.camera);

  final Iterable<MapDrawCommand> commands;
  final MapCameraReader camera;

  @override
  void paint(Canvas canvas, Size size) {
    final renderer = MapCommandRenderer(canvas: canvas, camera: camera);

    renderer.applyCameraTransform();
    renderer.paintAll(commands);
  }

  @override
  bool shouldRepaint(ScreenSpacePainter oldDelegate) {
    return !identical(commands, oldDelegate.commands) ||
        camera != oldDelegate.camera;
  }
}
