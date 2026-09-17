import 'package:flutter/gestures.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:vector_math/vector_math_64.dart'; // Nécessaire pour Vector2

Matrix4 buildCameraTransform(MapCamera camera) {
  final scale = camera.getZoomScale(camera.zoom, 0);

  final screenCenter = camera.nonRotatedSize.center(Offset.zero);
  final worldCenter = camera.projectAtZoom(camera.center, 0);

  return Matrix4.identity()
    ..translateByVector2(Vector2(screenCenter.dx, screenCenter.dy))
    ..rotateZ(camera.rotationRad)
    ..scaleByDouble(scale, scale, 1.0, 1.0)
    ..translateByVector2(Vector2(-worldCenter.dx, -worldCenter.dy));
}
