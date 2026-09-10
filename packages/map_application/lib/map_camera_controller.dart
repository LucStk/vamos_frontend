import 'dart:math';
import 'dart:ui';
import 'package:latlong2/latlong.dart';

abstract class Camera {
  Offset latLngToScreenOffset(LatLng latLng);
  LatLng screenOffsetToLatLng(Offset point);
}

abstract class MapCameraController extends Camera {
  void zoomTo(LatLng latLng, {double deltaZoom});
  void zoomIn();
  void zoomOut();
  void rotateTo(double degrees);

  double get rotation;

  Stream<double> get rotationStream;
  Stream<void> get cameraStream;
}
