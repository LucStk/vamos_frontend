import 'package:trip_application/trip_application.dart';

import '../../domain/camera/map_camera.dart';
import '../../mode_machine/base_command.dart';
import '../../mode_machine/base_command_resolver.dart';
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
        BaseCommandResolver {
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
    if (command is BaseCommand<R>) return resolveBase(command);
    if (command is! EditorCommand<R>) return null;

    final Object? result = await switch (command) {
      IdleEditorCommand c => resolveIdle(c),
      VertexSelectCommand c => resolveVertexSelect(c),
      SegmentSelectCommand c => resolveSegmentSelect(c),
      SketchCommand c => resolveSketch(c),
    };
    return result as R?;
  }
}
