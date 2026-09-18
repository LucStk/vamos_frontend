import 'package:map_application/base/application/camera_effects.dart';
import 'package:map_application/base/domain/domain.dart';
import 'package:map_engine/controller/domain/map_gesture.dart';

extension DoubleTapEditor on BaseController {
  void baseDoubleTapResolve(DoubleTapGesture gesture) {
    if (gesture.element == null) {
      zoomTo(gesture.offset);
    }
  }
}
