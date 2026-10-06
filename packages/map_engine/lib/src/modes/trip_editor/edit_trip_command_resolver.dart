import 'package:latlong2/latlong.dart';
import 'package:trip_application/trip_application.dart';

import '../../../map_engine.dart';

final class EditTripCommandResolver extends ModeCommandResolver<MapEditorMode>
    with
        GraphReader,
        WaypointReader,
        ScreenProjector,
        IdleEditorResolver,
        VertexSelectResolver,
        SegmentSelectResolver,
        SketchResolver {
  const EditTripCommandResolver({
    required this.graphEditor,
    required this.waypointEditor,
    required this.screenToLatLng,
  });

  @override
  final GraphEditor graphEditor;
  @override
  final WaypointEditor waypointEditor;
  @override
  final LatLng? Function(ScreenOffset) screenToLatLng;

  @override
  Future<R?> resolve<R extends Object>(
    ModeCommand<MapEditorMode, R> command,
  ) async {
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
