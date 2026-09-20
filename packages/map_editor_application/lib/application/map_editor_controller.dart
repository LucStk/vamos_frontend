import 'package:map_application/base_controller.dart';
import 'package:map_editor_application/application/application.dart';
import 'package:map_editor_application/domain/domain.dart';
import 'package:map_editor_application/domain/effect_queue.dart';
import 'package:trip_application/topology/application/graph_editor.dart';
import 'package:trip_application/waypoint/application/waypoint_editor.dart';

final class MapEditorController extends BaseController<MapEditorMode>
    with
        MapEditorPointerDownGesture,
        MapEditorDragGestures,
        MapEditorTapGesture {
  MapEditorController({
    required this.graphEditor,
    required this.waypointEditor,
    required super.camera,
    required super.onModeChanged,
  }) : super(initialMode: const Idle());

  final GraphEditor graphEditor;
  final WaypointEditor waypointEditor;

  final MapEffectQueue _effectQueue = MapEffectQueue();

  @override
  void executeEffect(Future<void> Function() effect) {
    _effectQueue.add(effect);
  }
}
