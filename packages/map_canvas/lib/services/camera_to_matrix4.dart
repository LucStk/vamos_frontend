import 'package:flutter/gestures.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:vector_math/vector_math_64.dart'; // Nécessaire pour Vector2

Matrix4 buildCameraTransform(MapCamera camera) {
  final scale = camera.getZoomScale(camera.zoom, 0);

  final center = camera.size.center(Offset.zero);
  final origin = camera.pixelOrigin;

  return Matrix4.identity()
    ..translateByVector2(Vector2(center.dx, center.dy))
    ..rotateZ(camera.rotationRad)
    ..translateByVector2(Vector2(-center.dx, -center.dy))
    ..translateByVector2(Vector2(-origin.dx, -origin.dy))
    ..scaleByDouble(scale, scale, 1.0, 1.0);
}
