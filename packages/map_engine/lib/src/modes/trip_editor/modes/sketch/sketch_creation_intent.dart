import '../../map_editor_command.dart';
import '/src/mode_machine/gesture_result.dart';
import '../../map_editor_mode.dart';

abstract final class SketchCreationIntens {
  static GestureResult<MapEditorMode> stopCreationAtPencil(SketchCreation s) {
    return GestureResult.run(
      CreateSegmentFromSketch(
        startVertexId: s.vertexStart,
        geometry: s.path,
        mobilityType: s.mobilityType,
      ),
      then: (current, _) => switch (current) {
        SketchCreation() => GestureResult.to(IdleEditor()),
        _ => null, // le mode a changé : rien à faire
      },
    );
  }
}
