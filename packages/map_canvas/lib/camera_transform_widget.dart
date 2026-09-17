import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:map_canvas/services/camera_to_matrix4.dart';

class CameraTransform extends StatelessWidget {
  const CameraTransform({super.key, required this.camera, required this.child});

  final MapCamera camera;
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
