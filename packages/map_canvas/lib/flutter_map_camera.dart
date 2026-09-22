// map_camera_controller.dart
import 'dart:math';

import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_engine/map_engine.dart';

import 'package:flutter/material.dart';

/// Implémentation unique de [MapCameraController].
///
/// Toujours utilisable dès sa création (basée sur un [MapController] brut).
/// Quand un [AnimatedMapController] est attaché — typiquement au montage
/// du widget carte — les actions (zoom, rotation...) passent par lui pour
/// bénéficier des animations. Tant qu'il n'est pas attaché (ou après un
/// détachement), elles retombent sur le [MapController] brut, de façon
/// instantanée.
class FlutterMapCamera implements MapCameraController {
  FlutterMapCamera(this._mapController);

  static const referenceZoom = 0.0;

  final MapController _mapController;
  AnimatedMapController? _animatedController;

  void attachAnimatedController(AnimatedMapController controller) {
    assert(
      identical(controller.mapController, _mapController),
      'AnimatedMapController doit envelopper le même MapController',
    );
    _animatedController = controller;
  }

  void detachAnimatedController() {
    _animatedController = null;
  }

  bool get _hasAnimation => _animatedController != null;

  MapCamera get _camera => _mapController.camera;

  // ---- Lecture : toujours via le MapController brut ----

  @override
  WorldOffset latLngToWorldOffset(LatLng position) =>
      WorldOffset(_camera.projectAtZoom(position, referenceZoom));

  @override
  double get zoomScale => _camera.getZoomScale(_camera.zoom, referenceZoom);

  @override
  ScreenOffset worldToScreen(WorldOffset offset) {
    final result = MatrixUtils.transformPoint(
      buildCameraTransform(this),
      offset.value,
    );
    return ScreenOffset(result);
  }

  @override
  WorldOffset screenToWorld(ScreenOffset offset) {
    final result = MatrixUtils.transformPoint(
      Matrix4.inverted(buildCameraTransform(this)),
      offset.value,
    );
    return WorldOffset(result);
  }

  @override
  ScreenOffset latLngToScreenOffset(LatLng position) =>
      ScreenOffset(_camera.getOffsetFromOrigin(position));

  @override
  LatLng screenOffsetToLatLng(ScreenOffset offset) =>
      _camera.offsetToCrs(offset.value);

  @override
  LatLng worldOffsetToLatLng(WorldOffset offset) =>
      _camera.unprojectAtZoom(offset.value, referenceZoom);

  // ---- Actions : animées si possible, sinon instantanées ----

  @override
  double get rotation => _camera.rotation;

  @override
  double get rotationRad => _camera.rotationRad;

  @override
  Size get size => _camera.size;

  @override
  ScreenOffset get screenCenter =>
      ScreenOffset(_camera.nonRotatedSize.center(Offset.zero));
  @override
  WorldOffset get worldCenter =>
      WorldOffset(_camera.projectAtZoom(_camera.center, 0));
  @override
  Stream<double> get rotationStream =>
      _mapController.mapEventStream.map((_) => _camera.rotation);

  @override
  Stream<void> get cameraStream => _mapController.mapEventStream.map((_) {});

  @override
  void zoomTo(LatLng latLng, {double deltaZoom = 1}) {
    final targetZoom = min(_camera.zoom + deltaZoom, _camera.maxZoom ?? 20);

    if (_hasAnimation) {
      _animatedController!.animateTo(dest: latLng, zoom: targetZoom);
    } else {
      _mapController.move(latLng, targetZoom);
    }
  }

  @override
  void zoomIn() {
    if (_hasAnimation) {
      _animatedController!.animatedZoomIn();
    } else {
      _mapController.move(
        _camera.center,
        min(_camera.zoom + 1, _camera.maxZoom ?? 20),
      );
    }
  }

  @override
  void zoomOut() {
    if (_hasAnimation) {
      _animatedController!.animatedZoomOut();
    } else {
      _mapController.move(
        _camera.center,
        max(_camera.zoom - 1, _camera.minZoom ?? 0),
      );
    }
  }

  @override
  void rotateTo(double degrees) {
    if (_hasAnimation) {
      _animatedController!.animatedRotateTo(degrees);
    } else {
      _mapController.rotate(degrees);
    }
  }
}
