import 'package:map_application/map_application.dart';
import 'package:map_engine/map_engine.dart';

extension TapViewer on MapViewerController {
  void tapResolve(TapGesture gesture) {
    switch ((viewerMode, gesture.element)) {
      case (Idle _, MapObject e) when e is TopologyObject:
        viewerMode = Idle(selection: e);
        return;

      case _:
    }
  }
}
