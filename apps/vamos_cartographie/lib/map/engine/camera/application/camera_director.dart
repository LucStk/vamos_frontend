import 'dart:async';
import 'dart:math';

import '/map/engine/camera/camera.dart';
import 'package:map_engine/domain/map_camera.dart';

final class CameraDirector {
  CameraDirector({required MapCameraController Function() camera})
    : _camera = camera;

  final MapCameraController Function() _camera;

  /// Priorité minimale acceptée. Elle ne fait que monter.
  CameraPriority _floor = CameraPriority.ambient;

  CameraRequest? _pending;
  bool _flushScheduled = false;

  bool _disposed = false;

  void dispose() => _disposed = true;

  /// Un geste utilisateur bloque les demandes ambient.
  void onUserGesture() {
    if (_floor.index < CameraPriority.content.index) {
      _floor = CameraPriority.content;
    }
  }

  void submit(CameraRequest request) {
    // Règle 1 : trop peu prioritaire par rapport à ce qui s'est déjà passé.
    if (request.priority.index < _floor.index) return;

    // Règle 2 : dans la même passe, la plus prioritaire gagne (à égalité, la dernière).
    final pending = _pending;
    if (pending == null || request.priority.index >= pending.priority.index) {
      _pending = request;
    }

    if (!_flushScheduled) {
      _flushScheduled = true;
      print("flushScheduld");
      scheduleMicrotask(_flush);
    }
  }

  void _flush() {
    _flushScheduled = false;
    if (_disposed) return;
    final request = _pending;
    _pending = null;
    if (request == null) return;

    // Règle 3 : ce qui a été exécuté relève le plancher.
    if (request.priority.index > _floor.index) _floor = request.priority;

    _run(request.target);
  }

  void _run(CameraTarget target) {
    final camera = _camera();
    print("camera run");
    switch (target) {
      case FocusPoint(:final point, :final zoom, :final minZoom):
        camera.zoomTo(point, deltaZoom: max(zoom ?? camera.zoomScale, minZoom));
      case FitBounds(:final bounds, :final padding):
        camera.fitBounds(bounds.toMapEngine(), padding: padding.toMapEngine());
    }
  }
}
