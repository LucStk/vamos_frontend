import 'package:map_application/base/base.dart';
import 'package:map_application/map_viewer/application/application.dart';
import 'package:map_application/map_viewer/domain/map_viewer_mode.dart';
import 'package:map_engine/controller/domain/domain.dart';

class MapViewerController extends BaseController {
  MapViewerController({required super.camera}) : viewerMode = const Idle();

  MapViewerMode viewerMode;

  @override
  void dispatchGesture(MapGesture gesture) {
    switch (gesture) {
      case TapGesture():
        tapResolve(gesture);

      case DoubleTapGesture():
        baseDoubleTapResolve(gesture);
      case _:
    }
  }
}
