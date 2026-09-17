import 'package:map_application/base/domain/base_controller.dart';
import 'package:map_application/map_application.dart';
import 'package:trip_application/topology/application/graph_editor.dart';
import 'package:trip_application/waypoint/application/waypoint_editor.dart';

class MapEditorController extends BaseController {
  MapEditorController({
    required this.graphEditor,
    required this.waypointEditor,
    required super.camera,
  }) : mapState = Idle();

  final GraphEditor graphEditor;
  final WaypointEditor waypointEditor;
  MapEditorMode mapState;
}
