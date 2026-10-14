import 'dart:async';
import 'dart:math';

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
      scheduleMicrotask(_flush);
    }
  }

  void _flush() {
    _flushScheduled = false;
    if (_disposed) return;
    final request = _pending;
    _pending = null;
    if (request == null) return;

    if (request.priority.index > _floor.index) _floor = request.priority;

    _remember();
    _run(request.target);
  }

  void _remember() {
    _history.add(_camera.pose);
    if (_history.length > _maxHistory) _history.removeAt(0);
  }

  void back() {
    if (_disposed || _history.isEmpty) return;
    _pending = null;
    _camera.restore(_history.removeLast());
  }

  void _run(CameraTarget target) {
    switch (target) {
      case FocusPoint(:final point, :final zoom, :final minZoom):
        _camera.zoomTo(
          point,
          deltaZoom: max(zoom ?? _camera.zoomScale, minZoom),
        );
      case FitBounds(:final bounds, :final padding):
        _camera.fitBounds(bounds, padding: padding);
      // camera_director.dart, dans _run
      case ZoomAt(:final point):
        final latLng = _camera.screenOffsetToLatLng(point);
        _camera.zoomIn(latLng: latLng);
    }
  }
}
