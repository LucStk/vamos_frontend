import 'package:latlong2/latlong.dart';
import 'package:map_engine/domain/offset_type.dart';

// map_camera_reader.dart (nouveau, lecture seule)
abstract interface class MapCameraReader {
  WorldOffset latLngToWorldOffset(LatLng position);
  ScreenOffset worldToScreen(WorldOffset position);
  WorldOffset screenToWorld(ScreenOffset position);
  double getZoomScale();
  ScreenOffset latLngToScreenOffset(LatLng position);
  LatLng screenOffsetToLatLng(ScreenOffset offset);
  LatLng worldOffsetToLatLng(WorldOffset offset);
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
