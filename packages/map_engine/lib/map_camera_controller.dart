import 'dart:ui';
import 'package:latlong2/latlong.dart';

// map_camera_reader.dart (nouveau, lecture seule)
abstract interface class MapCameraReader {
  Offset projectAtZoom(LatLng position, double zoom);
  double getZoomScale();
  Offset latLngToScreenOffset(LatLng position);
  LatLng screenOffsetToLatLng(Offset position);
}

abstract class MapCameraController extends MapCameraReader {
  double get rotation;
  Stream<double> get rotationStream;
  Stream<void> get cameraStream;
  void zoomTo(LatLng latLng, {double deltaZoom});
  void zoomIn();
  void zoomOut();
  void rotateTo(double degrees);
}
