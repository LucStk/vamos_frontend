// map_camera_controller.dart
import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_application/editor/map_camera_controller.dart';

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
  Point<double> project(LatLng latLng) {
    final offset = _camera.latLngToScreenOffset(latLng);
    return Point(offset.dx, offset.dy);
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
  Point<double> latLngToPoint(LatLng latLng) {
    final offset = animatedController.mapController.camera.latLngToScreenOffset(
      latLng,
    );
    return Point(offset.dx, offset.dy);
  }

  @override
  LatLng pointToLatLng(Point<double> point) {
    final latLng = animatedController.mapController.camera.screenOffsetToLatLng(
      Offset(point.x, point.y),
    );
    return latLng;
  }
}
