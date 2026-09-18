import 'package:map_application/base/application/camera_effects.dart';
import 'package:map_application/base/domain/domain.dart';
import 'package:map_engine/map_engine.dart';

extension BaseTapResolver on BaseController {
  void baseDoubleTapResolve(DoubleTapGesture gesture) {
    if (gesture.element == null) {
      zoomTo(gesture.offset);
    }
  }

  void baseTapResolve(TapGesture gesture) {
    switch ((mode, gesture.element)) {
      case (BaseMode _, MapObject e):
        mode = BaseMode(selection: e);
    }
  }
}
