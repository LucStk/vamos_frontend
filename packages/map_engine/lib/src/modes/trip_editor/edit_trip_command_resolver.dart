import 'package:trip_application/trip_application.dart';

import '../../domain/camera/map_camera.dart';
import '../../mode_machine/common_command.dart';
import '../../mode_machine/common_command_resolver.dart';
import '../../mode_machine/mode_command.dart';
import 'map_editor_command.dart';
import 'map_editor_mode.dart';

mixin GraphReader {}

final class EditTripCommandResolver extends ModeCommandResolver<MapEditorMode>
    with
        WaypointReader,
        IdleEditorResolver,
        VertexSelectResolver,
        SegmentSelectResolver,
        SketchResolver,
        CommonCommandResolver {
  const EditTripCommandResolver({
    required this.graphEditor,
    required this.waypointEditor,
    required this.camera,
  });

  @override
  final GraphEditor graphEditor;
  @override
  final WaypointEditor waypointEditor;
  @override
  final MapCameraController camera;
  @override
  Future<R?> resolve<R extends Object>(
    ModeCommand<MapEditorMode, R> command,
  ) async {
    if (command is CommonCommand<R>) return resolveBase(command);
    if (command is! EditorCommand<R>) return null;

    // On oublie le R précis ici : les resolvers renvoient de toute façon Object?.
    final EditorCommand<Object> cmd = command;

    final Object? result = await switch (cmd) {
      IdleEditorCommand c => resolveIdle(c),
      VertexSelectCommand c => resolveVertexSelect(c),
      SegmentSelectCommand c => resolveSegmentSelect(c),
      SketchCommand c => resolveSketch(c),
    };

    return result as R?;
  }
}
