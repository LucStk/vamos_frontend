import 'package:map_engine/visual/visual.dart';
import 'package:vector_math/vector_math_64.dart'; // Nécessaire pour Vector2

Matrix4 buildCameraTransform(MapCameraReader camera) {
  final scale = camera.zoomScale;

  final screenCenter = camera.screenCenter;
  final worldCenter = camera.worldCenter;

  return Matrix4.identity()
    ..translateByVector2(Vector2(screenCenter.dx, screenCenter.dy))
    ..rotateZ(camera.rotationRad)
    ..scaleByDouble(scale, scale, 1.0, 1.0)
    ..translateByVector2(Vector2(-worldCenter.dx, -worldCenter.dy));
}
