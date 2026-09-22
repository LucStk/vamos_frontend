import 'package:map_editor_application/domain/map_editor_mode.dart';
import 'package:map_engine/map_engine.dart';

import 'package:map_application/map_application.dart';

MapEditorMode? modeAfter(MapEditorMode current, CommandResult result) {
  return switch (result) {
    SegmentCreated(:final segment) || SegmentSpliced(:final segment) => Idle(
      selection: MapSegment(segment.id, segment.geometry),
    ),

    SegmentCorrected() || SegmentUpdated() => switch (current) {
      SketchEdition e => e.copyWith(path: []),
      _ => null,
    },

    SegmentDeleted(:final segmentId) => switch (current.selection) {
      MapSegment(:final id) when id == segmentId => current.withSelection(null),
      _ => null,
    },

    VertexRemoved(:final vertexId) => switch (current.selection) {
      MapVertex(:final id) when id == vertexId => current.withSelection(null),
      _ => null,
    },

    NoResult() => null,
  };
}
