import 'package:latlong2/latlong.dart';
import 'package:trip_application/trip_application.dart';

import '/src/mode_machine/gesture_result.dart';
import '../../../map_editor_command.dart';
import '../../../map_editor_mode.dart';

abstract final class VertexSelectIntents {
  static GestureResult<MapEditorMode> deleteVertex(VertexSelectMode m) {
    final id = m.vertex.id; // on capture une valeur, jamais `this`
    return GestureResult.run(
      RemoveVertex(id),
      then: (current, _) => switch (current) {
        VertexSelectMode(:final vertex) when vertex.id == id =>
          GestureResult.to(IdleEditor()),
        _ => null, // le mode a changé entre-temps : rien à faire
      },
    );
  }

  static GestureResult<MapEditorMode> sketchCreation(
    VertexSelectMode m,
    LatLng position,
  ) => GestureResult.to(
    SketchCreation(
      vertexStart: m.vertex.id,
      path: [position],
      mobilityType: MobilityType.bike,
    ),
  );
}
