import '../../map_editor_command.dart';
import '/src/mode_machine/transition.dart';
import '../../map_editor_mode.dart';

abstract final class SketchCreationIntens {
  static Transition<MapEditorMode> stopCreationAtPencil(SketchCreation s) {
    return Transition.run(
      CreateSegmentFromSketch(
        startVertexId: s.vertexStart,
        geometry: s.path,
        mobilityType: s.mobilityType,
      ),
      then: (current, _) => switch (current) {
        SketchCreation() => Transition.to(IdleEditor()),
        _ => null, // le mode a changé : rien à faire
      },
    );
  }
}
