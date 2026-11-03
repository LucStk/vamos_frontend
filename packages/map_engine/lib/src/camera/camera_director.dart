import 'dart:async';
import 'dart:math';
import 'dart:ui' show Size;

import 'package:domain_core/map_geo_bounds.dart';
import 'package:map_engine/src/domain/camera/camera_pose.dart';
import 'package:map_engine/src/domain/camera/camera_request.dart';
import 'package:map_engine/src/domain/camera/map_camera.dart';

final class CameraDirector {
  CameraDirector({required MapCameraController camera}) : _camera = camera;

  final MapCameraController _camera;

  /// Priorité minimale acceptée. Elle ne fait que monter.
  CameraPriority _floor = CameraPriority.ambient;
  final _history = <CameraPose>[];
  static const _maxHistory = 20;
  CameraRequest? _pending;
  bool _flushScheduled = false;

  bool _disposed = false;

  /// Taille actuelle de la zone carte (mise à jour par l'UI).
  Size _viewport = const Size(400, 800);

  /// À appeler depuis le widget qui connaît la taille réelle de la carte.
  void updateViewport(Size size) => _viewport = size;

  /// Padding par défaut pour un fitBounds, adapté à la taille d'écran.
  /// Téléphone : 50. Tablette / PC : jusqu'à 250, mais jamais plus de 30 %
  /// du petit côté afin de garder une zone visible.
  MapEdgeInsets get _defaultFitPadding {
    final shortest = _viewport.shortestSide;
    final value = shortest >= 600 ? min(250.0, shortest * 0.3) : 50.0;
    return MapEdgeInsets.all(value);
  }

  void dispose() => _disposed = true;

  /// Un geste utilisateur bloque les demandes ambient.
  void onUserGesture() {
    if (_floor.index < CameraPriority.content.index) {
      _floor = CameraPriority.content;
    }
  }

  void submit(CameraRequest request) {
    // Règle 1 : trop peu prioritaire par rapport à ce qui s'est déjà passé.
    if (request.priority.index < _floor.index) {
      print("Not priority enougth");
      return;
    }

    // Règle 2 : dans la même passe, la plus prioritaire gagne (à égalité, la dernière).
    final pending = _pending;
    if (pending == null || request.priority.index >= pending.priority.index) {
      _pending = request;
    }

    if (!_flushScheduled) {
      _flushScheduled = true;
      scheduleMicrotask(_flush);
    }
  }

  void _flush() {
    _flushScheduled = false;
    if (_disposed) return;
    final request = _pending;
    _pending = null;
    if (request == null) return;

    _remember();
    _run(request.target);
  }

  void resetFloor() => _floor = CameraPriority.ambient;

  void _remember() {
    _history.add(_camera.pose);
    if (_history.length > _maxHistory) _history.removeAt(0);
  }

  void back() {
    if (_disposed || _history.isEmpty) return;
    _pending = null;
    final saved = _history.removeLast();
    final current = _camera.pose;

    _camera.restore(
      saved.copyWith(
        zoom: min(saved.zoom, current.zoom),
        rotationDeg: current.rotationDeg,
      ),
    );
  }

  void _run(CameraTarget target) {
    switch (target) {
      case FocusPoint(:final point, :final zoom, :final minZoom):
        _camera.zoomTo(
          point,
          deltaZoom: max(zoom ?? _camera.zoomScale, minZoom),
        );
      case FitBounds(:final bounds, :final padding):
        _camera.fitBounds(bounds, padding: padding ?? _defaultFitPadding);
      case ZoomAt(:final point):
        final latLng = _camera.screenOffsetToLatLng(point);
        _camera.zoomIn(latLng: latLng);
    }
  }
}
