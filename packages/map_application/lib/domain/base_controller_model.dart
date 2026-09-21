import 'package:flutter/foundation.dart';

import 'base_mode_model.dart';
import 'package:map_engine/map_engine.dart';

// map_application
abstract interface class ModeHost<T extends BaseMode> {
  T get mode;
  set mode(T value);
}

base class BaseController<TMode extends BaseMode> implements ModeHost<TMode> {
  BaseController({
    required this.camera,
    required TMode initialMode,
    required void Function(TMode) onModeChanged,
  }) : _mode = initialMode,
       _onModeChanged = onModeChanged;

  final MapCameraController camera;
  final void Function(TMode) _onModeChanged;

  TMode _mode;
  @override
  TMode get mode => _mode;

  @override
  set mode(TMode value) {
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

  @protected
  void handlePointerDown(PointerDownGesture gesture) {}

  @protected
  void handleDragStart(DragStartGesture gesture) {}

  @protected
  void handleDragging(DraggingGesture gesture) {}

  @protected
  void handleDragEnd(DragEndGesture gesture) {}

  @protected
  void handleTap(TapGesture gesture) {
    switch ((mode, gesture.element)) {
      case (BaseMode _, MapObject e):
        mode = BaseMode(selection: e) as TMode;
    }
  }

  @protected
  void handleDoubleTap(DoubleTapGesture gesture) {
    if (gesture.element == null) {
      final latLng = camera.worldOffsetToLatLng(gesture.offset);
      camera.zoomTo(latLng);
    }
  }

  void handleOtherGesture(MapGesture gesture) {}
}
