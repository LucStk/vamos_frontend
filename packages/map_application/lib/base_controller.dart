import 'package:map_application/base_mode.dart';
import 'package:map_engine/map_engine.dart';

base class BaseController<TMode extends BaseMode> {
  BaseController({
    required this.camera,
    required TMode initialMode,
    required void Function(TMode) onModeChanged,
  }) : _mode = initialMode,
       _onModeChanged = onModeChanged;

  final MapCameraController camera;
  final void Function(TMode) _onModeChanged;

  TMode _mode;

  TMode get mode => _mode;

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

  void handlePointerDown(PointerDownGesture gesture) {}

  void handleDragStart(DragStartGesture gesture) {}

  void handleDragging(DraggingGesture gesture) {}

  void handleDragEnd(DragEndGesture gesture) {}

  void handleTap(TapGesture gesture) {
    switch ((mode, gesture.element)) {
      case (BaseMode _, MapObject e):
        mode = BaseMode(selection: e) as TMode;
    }
  }

  void handleDoubleTap(DoubleTapGesture gesture) {
    if (gesture.element == null) {
      final latLng = camera.worldOffsetToLatLng(gesture.offset);
      camera.zoomTo(latLng);
    }
  }

  void handleOtherGesture(MapGesture gesture) {}
}
