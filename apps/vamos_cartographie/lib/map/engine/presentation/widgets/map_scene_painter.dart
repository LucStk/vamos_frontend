import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_canvas/application/application.dart';
import 'package:vamos_cartographie/map/engine/injection/injection.dart';
import 'package:vamos_cartographie/map/engine/injection/map_commands_provider.dart';
import 'package:vamos_cartographie/map/engine/presentation/widgets/test_point_painter.dart';
import 'camera_transform_widget.dart';
import 'package:map_canvas/domain/domain.dart';
import 'package:map_engine/map_engine.dart';
import 'package:flutter_riverpod/misc.dart';

class MapScenePaint extends ConsumerWidget {
  const MapScenePaint({super.key, required this.sceneProvider});

  final ProviderListenable<MapScene> sceneProvider;

  //   @override
  //   Widget build(BuildContext context, WidgetRef ref) {
  //     final drawCommands = ref.watch(mapCommandsProvider(sceneProvider));
  //     final camera = ref.watch(mapCameraHolderProvider);

  //     return Stack(
  //       children: [
  //         // World layer :
  //         // la caméra transforme le canvas, la scène n'est pas repeinte
  //         // pendant les changements de caméra.
  //         CameraTransform(
  //           camera: camera,
  //           child: RepaintBoundary(
  //             child: CustomPaint(
  //               size: camera.size,
  //               painter: MapScenePainter(drawCommands),
  //             ),
  //           ),
  //         ),

  //         // Screen layer :
  //         // repeint lorsque la caméra change.
  //         RepaintBoundary(
  //           child: CustomPaint(
  //             size: camera.size,
  //             painter: ScreenSpacePainter(drawCommands, camera),
  //           ),
  //         ),
  //       ],
  //     );
  //   }
  // }
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final drawCommands = ref.watch(mapCommandsProvider(sceneProvider));
    final cameraSize = ref.watch(mapCameraHolderProvider.select((c) => c.size));
    print("mapScene rebuild");

    return Stack(
      children: [
        // 1. WORLD LAYER : Le rond subit la caméra (zoom/pan/rotation)
        RepaintBoundary(
          child: CameraTransform(
            child: CustomPaint(
              size: cameraSize,
              painter: const TestPointPainter(
                color: Colors.red,
                offset: Offset(100, 100),
              ), // Rond ROUGE
            ),
          ),
        ),

        // 2. SCREEN LAYER : Le rond reste fixe à l'écran
        // RepaintBoundary(
        //   child: CustomPaint(
        //     size: camera.size,
        //     painter: const TestPointPainter(color: Colors.blue), // Rond BLEU
        //   ),
        // ),
      ],
    );
  }
}

class MapScenePainter extends CustomPainter {
  const MapScenePainter(this.commands);

  final Iterable<MapDrawCommand> commands;

  @override
  void paint(Canvas canvas, Size size) {
    MapCommandRenderer(
      canvas: canvas,
    ).paintAll(commands, space: MapRenderSpace.world);
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

    renderer.paintAll(commands, space: MapRenderSpace.screen);
  }

  @override
  bool shouldRepaint(ScreenSpacePainter oldDelegate) {
    return !identical(commands, oldDelegate.commands) ||
        camera != oldDelegate.camera;
  }
}
