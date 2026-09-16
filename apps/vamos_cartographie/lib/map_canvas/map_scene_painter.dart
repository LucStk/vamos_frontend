import 'package:flutter/rendering.dart';
import 'package:map_engine/map_engine.dart';

class MapScenePainter extends CustomPainter {
  const MapScenePainter({required this.scene, required this.selection});

  final ProjectedScene scene;
  final MapObject? selection;

  @override
  void paint(Canvas canvas, Size size) {
    for (final projected in scene.describe()) {
      //On reverse pour avoir les objets les plus clicable au premier plan

      projected.paint(canvas, context: MapPaintContext(state: state));
    }
  }

  @override
  bool shouldRepaint(MapScenePainter oldDelegate) {
    return scene != oldDelegate.scene || selection != oldDelegate.selection;
  }
}
