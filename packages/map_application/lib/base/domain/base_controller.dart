import 'package:map_engine/map_engine.dart';
import 'package:map_application/base/application/application.dart';

class BaseMode {
  const BaseMode({this.selection});
  final MapObject? selection;
}

class BaseController<TMode extends BaseMode> {
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
      case TapGesture():
        baseTapResolve(gesture);

      case DoubleTapGesture():
        baseDoubleTapResolve(gesture);

      case _:
    }
  }
}
