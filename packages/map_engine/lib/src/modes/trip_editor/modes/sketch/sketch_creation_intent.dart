import '../../../../domain/sketch_trace.dart';
import '../../map_editor_command.dart';
import '/src/mode_machine/transition.dart';
import '../../map_editor_mode.dart';

abstract final class SketchCreationIntents {
  static Transition<MapEditorMode> stopCreationAtPencil(SketchCreation s) {
    return Transition.withSlot(sketchTraceSlot, (trace) {
      return Transition.run(
        CreateSegmentFromSketch(
          geometry: trace.points,
          mobilityType: trace.mobilityType,
        ),
        then: (current, _) => switch (current) {
          SketchCreation() => Transition.to(IdleEditor()),
          _ => null, // le mode a changé : rien à faire
        },
      );
    });
  }
}
