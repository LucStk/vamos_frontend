import 'package:flutter/rendering.dart';
import 'package:map_engine/map_engine.dart';

class MapScenePainter extends CustomPainter {
  const MapScenePainter({required this.scene, required this.selection});

  final ProjectedScene scene;
  final MapObject? selection;

  @override
  void paint(Canvas canvas, Size size) {
    MapDrawCommandPainter.paintAll(canvas, scene.describe());
  }

  @override
  bool shouldRepaint(MapScenePainter oldDelegate) {
    return scene != oldDelegate.scene || selection != oldDelegate.selection;
  }
}
