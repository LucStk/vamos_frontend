import 'dart:math';
import 'package:latlong2/latlong.dart';

abstract class MapCameraController {
  void zoomTo(LatLng latLng, {double deltaZoom});
  Point<double> project(LatLng latLng);
  void zoomIn();
  void zoomOut();
  void rotateTo(double degrees);
  double get rotation;
  Stream<double> get rotationStream;
  Point<double> latLngToPoint(LatLng latLng);
  LatLng pointToLatLng(Point<double> point);
}
