// map_camera_controller.dart
import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_engine/map_engine.dart';

class FlutterMapCameraController implements MapCameraController {
  final AnimatedMapController animatedController;

  FlutterMapCameraController(this.animatedController);

  MapCamera get _camera => animatedController.mapController.camera;

  @override
  void zoomTo(LatLng latLng, {double deltaZoom = 1}) {
    final targetZoom = min(_camera.zoom + deltaZoom, _camera.maxZoom ?? 20);

    animatedController.animateTo(dest: latLng, zoom: targetZoom);
  }

  @override
  void zoomIn() => animatedController.animatedZoomIn();

  @override
  void zoomOut() => animatedController.animatedZoomOut();

  @override
  void rotateTo(double degrees) => animatedController.animatedRotateTo(degrees);

  @override
  double get rotation => _camera.rotation;

  @override
  Stream<double> get rotationStream => animatedController
      .mapController
      .mapEventStream
      .map((_) => _camera.rotation);

  @override
  Stream<void> get cameraStream =>
      animatedController.mapController.mapEventStream.map((_) {});

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
