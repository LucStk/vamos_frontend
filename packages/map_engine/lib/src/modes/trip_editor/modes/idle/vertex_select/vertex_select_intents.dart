import 'package:latlong2/latlong.dart';
import 'package:trip_application/trip_application.dart';

import '/src/mode_machine/gesture_result.dart';
import '../../../map_editor_command.dart';
import '../../../map_editor_mode.dart';

abstract final class VertexSelectIntents {
  static GestureResult<MapEditorMode> deleteVertex(VertexSelectMode m) {
    final id = m.vertexId; // on capture une valeur, jamais `this`
    return GestureResult.run(
      RemoveVertex(id),
      then: (current, _) => switch (current) {
        VertexSelectMode(:final vertexId) when vertexId == id =>
          GestureResult.to(IdleEditor()),
        _ => null, // le mode a changé entre-temps : rien à faire
      },
    );
  }

  static GestureResult<MapEditorMode> createWaypointFromVertex(
    VertexSelectMode m,
  ) {
    final id = m.vertexId; // on capture une valeur, jamais `this`
    return GestureResult.run(
      CreateWaypointFromVertex(id),
      // then: (current, _) => switch (current) {
      //   VertexSelectMode(:final vertexId) when vertexId == id =>
      //     GestureResult.to(IdleEditor()),
      //   _ => null, // le mode a changé entre-temps : rien à faire
      // },
    );
  }

  static GestureResult<MapEditorMode> sketchCreation(
    VertexSelectMode m,
    LatLng position,
  ) => GestureResult.to(
    SketchCreation(
      vertexStart: m.vertexId,
      path: [position],
      mobilityType: MobilityType.bike,
    ),
  );
}
