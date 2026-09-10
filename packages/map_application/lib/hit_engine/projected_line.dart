import 'dart:math';

import 'package:map_application/domain/domain.dart';
import 'package:map_application/hit_engine/hit_tester.dart';
import 'package:map_application/map_camera_controller.dart';
import 'package:map_application/utiles/polyline_dist.dart';

class ProjectedLine extends ProjectedObject {
  final List<Point<double>> projectedPoints;

  ProjectedLine({required MapLine object, required MapCameraController camera})
    : projectedPoints = object.geometry
          .map((latLng) => camera.latLngToPoint(latLng))
          .toList(),
      super(object);

  @override
  bool isHitAt(Point<double> point) {
    final d = distanceTo(point);
    if (d < object.radius) {
      return true;
    }
    return false;
  }

  double distanceTo(Point<double> position) {
    if (projectedPoints.length < 2) {
      return projectedPoints.isEmpty
          ? double.infinity
          : _distanceToPoint(projectedPoints.first, position);
    }
    double minDist = double.infinity;
    for (var i = 0; i < projectedPoints.length - 1; i++) {
      final d = _distanceToSegment(
        projectedPoints[i],
        projectedPoints[i + 1],
        position,
      );
      if (d < minDist) minDist = d;
    }
    return minDist;
  }

  static double _distanceToPoint(Point<double> a, Point<double> b) =>
      sqrt(pow(a.x - b.x, 2) + pow(a.y - b.y, 2));

  static double _distanceToSegment(
    Point<double> a,
    Point<double> b,
    Point<double> p,
  ) {
    final t = projectScalarOnSegment(
      px: p.x,
      py: p.y,
      ax: a.x,
      ay: a.y,
      bx: b.x,
      by: b.y,
    );
    final projX = a.x + t * (b.x - a.x);
    final projY = a.y + t * (b.y - a.y);
    return _distanceToPoint(Point(projX, projY), p);
  }
}
