import 'dart:ui';
import 'package:latlong2/latlong.dart';

// map_camera_reader.dart (nouveau, lecture seule)
abstract class MapCameraReader {
  double get rotation;
  Stream<double> get rotationStream;
  Stream<void> get cameraStream;
  Offset latLngToScreenOffset(LatLng latLng);
  LatLng screenOffsetToLatLng(Offset point);
}

abstract class MapCameraController extends MapCameraReader {
  void zoomTo(LatLng latLng, {double deltaZoom});
  void zoomIn();
  void zoomOut();
  void rotateTo(double degrees);
}
