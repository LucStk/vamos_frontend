import 'dart:math';

import 'package:map_application/map_application.dart';

class ProjectedPoint extends ProjectedObject {
  final Point<double> projectedPosition;

  ProjectedPoint({
    required MapPoint object,
    required MapCameraController camera,
  }) : projectedPosition = camera.latLngToPoint(object.position),
       super(object);

  @override
  bool isHitAt(Point<double> point) {
    if (distanceTo(point) < object.radius) {
      return true;
    }
    return false;
  }

  double distanceTo(Point<double> position) =>
      position.distanceTo(projectedPosition);
}
