import 'package:trip_application/trip_application.dart';
import '../../../../mode_machine/gesture_result.dart';
import '../../map_editor_command.dart';
import '../../map_editor_mode.dart';

abstract final class SketchIntents {
  static GestureResult<MapEditorMode> deleteSegment(SegmentSelectMode s) {
    final id = s.segmentId; // on capture une valeur, jamais `this`
    return GestureResult.run(
      DeleteSegment(id),
      then: (current, _) => switch (current) {
        SegmentSelectMode(:final segmentId) when segmentId == id =>
          GestureResult.to(IdleEditor()),
        _ => null, // le mode a changé : rien à faire
      },
    );
  }

  static GestureResult<MapEditorMode> changeSegmentType(
    SketchEdition s,
    MobilityType type,
  ) => GestureResult.run(ChangeSegmentType(s.segmentId, type));

  static GestureResult<MapEditorMode> stopSketch(SketchMode s) => switch (s) {
    SketchEdition e => GestureResult.to(
      SegmentSelectMode(segmentId: e.segmentId),
    ),
    _ => GestureResult.to(IdleEditor()),
  };
}
