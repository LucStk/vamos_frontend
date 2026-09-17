import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_canvas/services/camera_to_matrix4.dart';
import 'package:map_engine/map_engine.dart';

class FlutterMapCameraReader implements MapCameraReader {
  static const referenceZoom = 0.0;
  FlutterMapCameraReader(this.controller);

  final MapController controller;

  MapCamera get _camera => controller.camera;

  @override
  WorldOffset latLngToWorldOffset(LatLng position) {
    return WorldOffset(_camera.projectAtZoom(position, referenceZoom));
  }

  @override
  double getZoomScale() {
    return _camera.getZoomScale(_camera.zoom, referenceZoom);
  }

  @override
  ScreenOffset worldToScreen(WorldOffset offset) {
    final result = MatrixUtils.transformPoint(
      buildCameraTransform(_camera),
      offset.value,
    );

    return ScreenOffset(result);
  }

  @override
  WorldOffset screenToWorld(ScreenOffset offset) {
    final result = MatrixUtils.transformPoint(
      Matrix4.inverted(buildCameraTransform(_camera)),
      offset.value,
    );

    return WorldOffset(result);
  }

  @override
  ScreenOffset latLngToScreenOffset(LatLng position) {
    return ScreenOffset(_camera.getOffsetFromOrigin(position));
  }

  @override
  LatLng screenOffsetToLatLng(ScreenOffset offset) {
    return _camera.offsetToCrs(offset.value);
  }

  @override
  LatLng worldOffsetToLatLng(WorldOffset offset) {
    return _camera.unprojectAtZoom(offset.value, referenceZoom);
  }
}
