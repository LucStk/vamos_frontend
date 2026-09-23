import 'package:flutter/material.dart';
import 'package:map_engine/services/camera_to_matrix4.dart';
import 'package:map_engine/map_engine.dart' as map_engine;

class CameraTransform extends StatelessWidget {
  const CameraTransform({super.key, required this.camera, required this.child});
  // Permet de déplacer le canvas en restant sync avec la camera

  final map_engine.MapCameraReader camera;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final transform = buildCameraTransform(camera);
    return Transform(
      alignment: Alignment.topLeft,
      transform: transform,
      child: child,
    );
  }
}
