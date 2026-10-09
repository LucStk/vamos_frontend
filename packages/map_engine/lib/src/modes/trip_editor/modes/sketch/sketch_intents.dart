import 'package:trip_application/trip_application.dart';
import '/src/domain/selection.dart';
import '/src/mode_machine/transition.dart';
import '../../map_editor_mode.dart';
import '../../map_editor_command.dart';

abstract final class SketchIntents {
  static Transition<MapEditorMode> changeSegmentType(
    SketchEdition s,
    MobilityType type,
  ) => Transition.run(ChangeSegmentType(s.segmentId, type));

  static Transition<MapEditorMode> stopSketch(SketchEdition s) => Transition.to(
    IdleEditor(),
  ).and(selectionSlot, SegmentSelection(s.segmentId));
}
