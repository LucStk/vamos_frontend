import 'package:flutter/animation.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_engine/map_camera_controller.dart';

class FlutterMapCameraReader implements MapCameraReader {
  FlutterMapCameraReader(this.controller);

  final MapController controller;

  MapCamera get _camera => controller.camera;

  @override
  Offset projectAtZoom(LatLng position, double zoom) {
    return _camera.projectAtZoom(position, zoom);
  }

  @override
  double getZoomScale() {
    return _camera.getZoomScale(_camera.zoom, 0);
  }

  @override
  Offset latLngToScreenOffset(LatLng position) {
    return _camera.getOffsetFromOrigin(position);
  }

  @override
  LatLng screenOffsetToLatLng(Offset offset) {
    return _camera.offsetToCrs(offset);
  }
}
