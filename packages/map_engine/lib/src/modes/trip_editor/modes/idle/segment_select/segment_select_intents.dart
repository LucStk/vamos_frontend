import '../../../../../mode_machine/gesture_result.dart';
import '../../../map_editor_mode.dart';

abstract final class SegmentSelectIntents {
  static GestureResult<MapEditorMode> deleteSegment(SegmentSelectMode s) {
    final id = s.segment.id; // on capture une valeur, jamais `this`
    return GestureResult.run(
      DeleteSegment(id),
      then: (current, _) => switch (current) {
        SegmentSelectMode(:final segment) when segment.id == id =>
          GestureResult.to(IdleEditor()),
        _ => null, // le mode a changé : rien à faire
      },
    );
  }

  static GestureResult<MapEditorMode> startSegmentEdit(SegmentSelectMode s) =>
      GestureResult.to(SketchEdition(segment: s.segment, path: []));
}
