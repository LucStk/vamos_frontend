import '/domain/domain.dart';
import 'package:vector_math/vector_math_64.dart'; // Nécessaire pour Vector2

Matrix4 buildCameraTransform({
  required double scale,
  required ScreenOffset screenCenter,
  required WorldOffset worldCenter,
  required double rotationRad,
}) {
  return Matrix4.identity()
    ..translateByVector2(Vector2(screenCenter.dx, screenCenter.dy))
    ..rotateZ(rotationRad)
    ..scaleByDouble(scale, scale, 1.0, 1.0)
    ..translateByVector2(Vector2(-worldCenter.dx, -worldCenter.dy));
}
