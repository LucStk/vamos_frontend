import 'package:trip_application/trip_application.dart';
import '/src/domain/selection.dart';
import '/src/mode_machine/gesture_result.dart';
import '../../map_editor_mode.dart';
import '../../map_editor_command.dart';

abstract final class SketchIntents {
  static GestureResult<MapEditorMode> changeSegmentType(
    SketchEdition s,
    MobilityType type,
  ) => GestureResult.run(ChangeSegmentType(s.segmentId, type));

  static GestureResult<MapEditorMode> stopSketch(SketchEdition s) =>
      GestureResult.to(
        IdleEditor(),
      ).and(selectionSlot, SegmentSelection(s.segmentId));
}
