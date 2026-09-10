import 'package:flutter/rendering.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:map_application/domain/map_scene.dart';

class MapScenePainter extends CustomPainter {
  const MapScenePainter({required this.scene, required this.camera});

  final MapScene scene;
  final MapCamera camera;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    // test : centre de l'écran
    canvas.drawCircle(size.center(Offset.zero), 20, paint);
  }

  @override
  bool shouldRepaint(MapScenePainter oldDelegate) {
    return scene != oldDelegate.scene || camera != oldDelegate.camera;
  }
}
