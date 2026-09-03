import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_application/editor/map_editor.dart';

class FlutterMapCameraController implements MapCameraController {
  final AnimatedMapController animatedController;
  FlutterMapCameraController(this.animatedController);

  @override
  void zoomTo(LatLng latLng, {double deltaZoom = 1}) {
    final camera = animatedController.mapController.camera;
    final targetZoom = min(camera.zoom + deltaZoom, camera.maxZoom ?? 20);
    animatedController.animateTo(dest: latLng, zoom: targetZoom);
  }

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
