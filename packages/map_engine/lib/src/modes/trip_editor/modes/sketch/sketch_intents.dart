import 'package:trip_application/trip_application.dart';
import '../../../../mode_machine/gesture_result.dart';
import '../../map_editor_command.dart';
import '../../map_editor_mode.dart';

abstract final class SketchIntents {
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

  static GestureResult<MapEditorMode> changeSegmentType(
    SketchEdition s,
    MobilityType type,
  ) => GestureResult.run(ChangeSegmentType(s.segment.id, type));

  static GestureResult<MapEditorMode> stopSketch(SketchMode s) => switch (s) {
    SketchEdition e => GestureResult.to(SegmentSelectMode(segment: e.segment)),
    _ => GestureResult.to(IdleEditor()),
  };
}
