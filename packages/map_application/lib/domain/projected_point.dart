import 'dart:ui';
import 'package:map_application/map_application.dart';

class ProjectedPoint extends ProjectedObject {
  final Offset projectedPosition;

  ProjectedPoint({required MapPoint object, required Camera camera})
    : projectedPosition = camera.latLngToScreenOffset(object.position),
      super(object);

  @override
  bool isHitAt(Offset point) {
    if (distanceTo(point) < object.radius) {
      return true;
    }
    return false;
  }

  double distanceTo(Offset position) => (position - projectedPosition).distance;
}
