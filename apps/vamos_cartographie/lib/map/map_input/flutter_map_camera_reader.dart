import 'package:flutter/animation.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_application/map_camera_controller.dart';

class FlutterMapCameraReader implements MapCameraReader {
  final MapController controller;
  FlutterMapCameraReader(this.controller);

  MapCamera get _camera => controller.camera;

  @override
  Offset latLngToScreenOffset(LatLng latLng) =>
      _camera.latLngToScreenOffset(latLng);

  @override
  LatLng screenOffsetToLatLng(Offset point) =>
      _camera.screenOffsetToLatLng(point);
}
