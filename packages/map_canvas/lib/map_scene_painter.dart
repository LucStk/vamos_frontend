import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_canvas/domain/domain.dart';
import 'package:map_engine/map_engine.dart';
import 'package:flutter_riverpod/misc.dart';

class MapScenePaint extends ConsumerWidget {
  const MapScenePaint({super.key, required this.sceneProvider});

  final ProviderListenable<MapScene> sceneProvider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scene = ref.watch(sceneProvider);

    return CustomPaint(painter: MapScenePainter(scene), size: Size.infinite);
  }
}

class MapScenePainter extends CustomPainter {
  const MapScenePainter(this.scene);

  final MapScene scene;

  @override
  void paint(Canvas canvas, Size size) {
    MapDrawCommandPainter.paintAll(canvas, scene.projectedScene.describe());
  }

  @override
  bool shouldRepaint(MapScenePainter oldDelegate) {
    return scene != oldDelegate.scene;
  }
}
