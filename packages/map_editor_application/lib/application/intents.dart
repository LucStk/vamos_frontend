import 'package:map_application/map_application.dart';
import 'package:map_editor_application/domain/domain.dart';
import 'package:map_engine/visual/domain/map_objects.dart';
import 'package:trip_application/topology/topology.dart';

/// Supprime l'objet sélectionné (vertex ou segment).
GestureResult<MapEditorMode> deleteSelection(MapEditorMode mode) {
  return switch (mode.selection) {
    MapVertex(:final id) => GestureResult(command: RemoveVertex(id)),
    MapSegment(:final id) => GestureResult(command: DeleteSegment(id)),
    _ => const GestureResult.none(),
  };
}

/// Change le type de mobilité du segment sélectionné.
GestureResult<MapEditorMode> changeSelectedSegmentType(
  MapEditorMode mode,
  MobilityType type,
) {
  return switch (mode.selection) {
    MapSegment(:final id) => GestureResult(
      command: ChangeSelectedSegmentType(id, type),
    ),
    _ => const GestureResult.none(),
  };
}
