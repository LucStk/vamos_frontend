import 'dart:math';
import 'package:latlong2/latlong.dart';

abstract class MapCameraController {
  void zoomTo(LatLng latLng, {double deltaZoom});
  void zoomIn();
  void zoomOut();
  void rotateTo(double degrees);

  double get rotation;

  Stream<double> get rotationStream;
  Stream<void> get cameraStream;

  Point<double> latLngToPoint(LatLng latLng);
  LatLng pointToLatLng(Point<double> point);
}
