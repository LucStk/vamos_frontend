import 'dart:math';

import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_engine/map_engine.dart';

import '/map/camera/camera.dart';
import 'package:flutter/material.dart';

/// Implémentation unique de [MapCameraController].
///
/// Toujours utilisable dès sa création (basée sur un [MapController] brut).
/// Quand un [AnimatedMapController] est attaché — typiquement au montage
/// du widget carte — les actions (zoom, rotation...) passent par lui pour
/// bénéficier des animations. Tant qu'il n'est pas attaché (ou après un
/// détachement), elles retombent sur le [MapController] brut, de façon
/// instantanée.
//
class FlutterMapCamera implements MapCameraController {
  FlutterMapCamera(this.mapController);

  static const referenceZoom = 0.0;

  final MapController mapController;
  AnimatedMapController? _animatedController;

  void attachAnimatedController(TickerProvider ticker) {
    _animatedController = AnimatedMapController(
      vsync: ticker,
      mapController: mapController,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOutCubic,
    );
  }

  void detachAnimatedController() {
    _animatedController?.dispose();
    _animatedController = null;
  }

  bool get _hasAnimation => _animatedController != null;

  MapCamera get _camera => mapController.camera;

  // ---- Lecture : toujours via le MapController brut ----

  @override
  WorldOffset latLngToWorldOffset(LatLng position) =>
      WorldOffset(_camera.projectAtZoom(position, referenceZoom));

  @override
  double get zoomScale => _camera.getZoomScale(_camera.zoom, referenceZoom);

  Matrix4 get transformMatrix => buildCameraTransform(
    scale: zoomScale,
    screenCenter: screenCenter,
    worldCenter: worldCenter,
    rotationRad: rotationRad,
  );

  @override
  ScreenOffset worldToScreen(WorldOffset offset) {
    final result = MatrixUtils.transformPoint(transformMatrix, offset.value);
    return ScreenOffset(result);
  }

  @override
  WorldOffset screenToWorld(ScreenOffset offset) {
    final result = MatrixUtils.transformPoint(
      Matrix4.inverted(transformMatrix),
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
      mapController.mapEventStream.map((_) => _camera.rotation);

  @override
  Stream<void> get cameraStream => mapController.mapEventStream.map((_) {});

  @override
  void zoomTo(LatLng latLng, {double deltaZoom = 1}) {
    final targetZoom = min(_camera.zoom + deltaZoom, _camera.maxZoom ?? 20);

    if (_hasAnimation) {
      _animatedController!.animateTo(dest: latLng, zoom: targetZoom);
    } else {
      mapController.move(latLng, targetZoom);
    }
  }

  @override
  void zoomIn() {
    if (_hasAnimation) {
      _animatedController!.animatedZoomIn();
    } else {
      mapController.move(
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
      mapController.move(
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
      mapController.rotate(degrees);
    }
  }

  // FlutterMapCamera
  @override
  // Signature avec un Record Dart :
  void fitBounds(
    MapLatLngBounds bounds, {
    MapEdgeInsets padding = MapEdgeInsets.zero,
    double? maxZoom,
  }) {
    final fit = CameraFit.bounds(
      bounds: bounds.toFlutterMap(),
      padding: EdgeInsets.fromLTRB(
        padding.left,
        padding.top,
        padding.right,
        padding.bottom,
      ),
      maxZoom: maxZoom,
    );
    // ...

    final animated =
        _animatedController; // ton champ attaché via attachAnimatedController
    if (animated != null) {
      animated.animatedFitCamera(cameraFit: fit);
    } else {
      mapController.fitCamera(fit);
    }
  }
}
