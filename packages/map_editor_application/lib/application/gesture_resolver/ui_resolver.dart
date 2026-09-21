import 'package:map_application/application/application.dart';
import 'package:map_application/domain/domain.dart';
import 'package:map_editor_application/domain/map_editor_mode.dart';
import 'package:map_engine/map_engine.dart';
import 'package:trip_application/topology/topology.dart';

GestureResult<MapEditorMode> deleteSelection(MapEditorMode mode) {
  return switch (mode.selection) {
    MapVertex(:final id) => GestureResult(command: RemoveVertex(id)),
    MapSegment(:final id) => GestureResult(command: DeleteSegment(id)),
    _ => GestureResult(),
  };
}

GestureResult<MapEditorMode> changeSelectedSegmentType(
  MapEditorMode mode,
  MobilityType type,
) {
  return switch (mode.selection) {
    MapSegment(:final id) => GestureResult(
      command: ChangeSelectedSegmentType(id, type),
    ),
    _ => GestureResult(),
  };
}
