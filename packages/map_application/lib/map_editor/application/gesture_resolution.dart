import 'package:map_application/base/application/tap_resolver.dart';
import 'package:map_application/map_application.dart';
import 'package:map_engine/controller/domain/map_gesture.dart';

extension ResolveGesture on MapEditorController {
  void resolveGesture(MapGesture gesture) {
    switch (gesture) {
      case DoubleTapGesture():
        baseDoubleTapResolve(gesture);
      case TapGesture():
      case _:
    }
  }
}
