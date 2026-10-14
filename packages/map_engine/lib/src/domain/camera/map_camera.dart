import 'dart:ui';

import 'package:domain_core/map_geo_bounds.dart';
import 'package:domain_core/space/offset_type.dart';
import 'package:latlong2/latlong.dart';

typedef CameraPose = ({LatLng center, double zoom, double rotationDeg});

// map_camera_reader.dart (nouveau, lecture seule)
abstract interface class MapCameraReader {
  WorldOffset latLngToWorldOffset(LatLng position);
  ScreenOffset worldToScreen(WorldOffset position);
  WorldOffset screenToWorld(ScreenOffset position);
  double get zoomScale;
  ScreenOffset latLngToScreenOffset(LatLng position);
  LatLng screenOffsetToLatLng(ScreenOffset offset);
  LatLng worldOffsetToLatLng(WorldOffset offset);
  double get rotationRad;
  LatLng get center;
  ScreenOffset get screenCenter;
  WorldOffset get worldCenter;
  CameraPose get pose;
  Size get size;
}

abstract class MapCameraController extends MapCameraReader {
  double get rotation;
  Stream<double> get rotationStream;
  Stream<void> get cameraStream;
  void zoomTo(LatLng latLng, {double deltaZoom});
  void zoomIn({LatLng? latLng});
  void zoomOut();
  void rotateTo(double degrees);
  void fitBounds(
    MapLatLngBounds bounds, {
    MapEdgeInsets padding = MapEdgeInsets.zero,
    double? maxZoom,
  });
  void restore(CameraPose pose);
}
