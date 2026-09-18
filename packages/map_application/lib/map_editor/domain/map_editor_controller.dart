import 'package:map_application/base/base.dart';
import 'package:map_application/map_application.dart';
import 'package:map_application/map_editor/application/gesture_resolver/gestures_resolver.dart';
import 'package:map_application/map_editor/domain/effect_queue.dart';
import 'package:map_engine/controller/domain/map_gesture.dart';
import 'package:trip_application/topology/application/graph_editor.dart';
import 'package:trip_application/waypoint/application/waypoint_editor.dart';
import 'package:map_application/map_viewer/map_viewer.dart';

class MapEditorController extends BaseController {
  MapEditorController({
    required this.graphEditor,
    required this.waypointEditor,
    required super.camera,
  }) : editorMode = const Idle();

  final GraphEditor graphEditor;
  final WaypointEditor waypointEditor;

  MapViewerMode editorMode;

  final MapEffectQueue _effectQueue = MapEffectQueue();

  void executeEffect(Future<void> Function() effect) {
    _effectQueue.add(effect);
  }

  void dispatchGesture(MapGesture gesture) {
    switch (gesture) {
      case PointerDownGesture():
        pointerDownResolve(gesture);

      case DragStartGesture():
        dragStartResolve(gesture);

      case DraggingGesture():
        dragUpdateResolve(gesture);

      case DragEndGesture():
        dragEndResolve(gesture);

      case TapGesture():
        tapResolve(gesture);

      case DoubleTapGesture():
        baseDoubleTapResolve(gesture);
    }
  }
}
