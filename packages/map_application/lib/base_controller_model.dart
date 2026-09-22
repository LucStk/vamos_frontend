import 'package:flutter/foundation.dart';
import 'package:map_application/gesture_result_model.dart';

import 'base_mode_model.dart';
import 'package:map_engine/map_engine.dart';

base class BaseController<M extends BaseMode<M>> {
  BaseController({
    required this.camera,
    required M initialMode,
    required void Function(M) onModeChanged,
  }) : _mode = initialMode,
       _onModeChanged = onModeChanged;

  final MapCameraController camera;
  final void Function(M) _onModeChanged;

  M _mode;
  M get mode => _mode;

  @protected
  set mode(M value) {
    if (_mode == value) return;

    _mode = value;
    _onModeChanged(value);
  }

  void dispatchGesture(MapGesture gesture) {
    switch (gesture) {
      case PointerDownGesture():
        handlePointerDown(gesture);
      case DragStartGesture():
        handleDragStart(gesture);
      case DraggingGesture():
        handleDragging(gesture);
      case DragEndGesture():
        handleDragEnd(gesture);
      case TapGesture():
        handleTap(gesture);
      case DoubleTapGesture():
        handleDoubleTap(gesture);
    }
  }

  // --- Gestures déléguées au handler du mode courant ---

  @protected
  void handlePointerDown(PointerDownGesture g) {
    final p = camera.worldOffsetToLatLng(g.offset);
    apply(mode.handler.onPointerDown(g, p));
  }

  @protected
  void handleDragStart(DragStartGesture g) =>
      apply(mode.handler.onDragStart(g));

  @protected
  void handleDragging(DraggingGesture g) {
    final p = camera.worldOffsetToLatLng(g.offset);
    apply(mode.handler.onDragging(g, p));
  }

  @protected
  void handleDragEnd(DragEndGesture g) => apply(mode.handler.onDragEnd(g));

  @protected
  void handleTap(TapGesture g) => apply(mode.handler.onTap(g));

  // --- Comportement natif : zoom au double tap sur une zone vide ---

  @protected
  void handleDoubleTap(DoubleTapGesture g) {
    if (g.element != null) return;
    camera.zoomTo(camera.worldOffsetToLatLng(g.offset));
  }

  void handleOtherGesture(MapGesture gesture) {}

  // --- Application d'un résultat ---

  @protected
  void apply(GestureResult<M> result) {
    final next = result.mode;
    if (next != null) mode = next;

    final command = result.command;
    if (command != null) onCommand(command);
  }

  /// Par défaut les commandes sont ignorées : un controller sans I/O
  /// (comme le controller "view") n'a rien à surcharger.
  @protected
  void onCommand(MapCommand command) {}
}
