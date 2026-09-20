import 'package:map_application/base_controller.dart';
import 'package:map_editor_application/domain/domain.dart';
import 'package:map_editor_application/domain/effect_queue.dart';
import 'package:map_engine/controller/domain/map_gesture.dart';
import 'package:trip_application/topology/application/graph_editor.dart';
import 'package:trip_application/waypoint/application/waypoint_editor.dart';

final class MapEditorController extends BaseController<MapEditorMode> {
  MapEditorController({
    required this.graphEditor,
    required this.waypointEditor,
    required super.camera,
    required super.onModeChanged,
  }) : super(initialMode: const Idle());

  final GraphEditor graphEditor;
  final WaypointEditor waypointEditor;

  final MapEffectQueue _effectQueue = MapEffectQueue();

  void executeEffect(Future<void> Function() effect) {
    _effectQueue.add(effect);
  }

  @override
  void handleGesture(MapGesture gesture) {
    switch (gesture) {
      case PointerDownGesture():
        pointerDownResolve(gesture);

      case DragStartGesture():
        dragStartResolve(gesture);

      case DraggingGesture():
        dragUpdateResolve(gesture);

      case DragEndGesture():
        dragEndResolve(gesture);

      default:
        super.handleGesture(gesture);
    }
  }

  @override
  void handleTap(TapGesture gesture) {
    tapResolve(gesture);
  }

  void pointerDownResolve(PointerDownGesture gesture) {
    // ...
  }

  void dragStartResolve(DragStartGesture gesture) {
    // ...
  }

  void dragUpdateResolve(DraggingGesture gesture) {
    // ...
  }

  void dragEndResolve(DragEndGesture gesture) {
    // ...
  }

  void tapResolve(TapGesture gesture) {
    // ...
  }
}
