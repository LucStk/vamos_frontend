import 'package:map_application/map_application.dart';
import 'package:trip_application/trip_application.dart';
import "dart:async";

extension CollisionEditor on MapEditor {
  bool onCollision(MapElement dragged, MapElement target) {
    switch ((mode, dragged, target)) {
      case (SketchMode m, MapSketchPencil _, MapVertex v):
        print("collision with vertex");
        switch (m) {
          case SketchCreation mode:
            // On était en train de créer un segment
            // On demande au serveur de créer un segment
            SketchMode newMode = mode.mergeCorrection();
            unawaited(
              runEffect(
                CreateSegmentFromSketch(
                  startVertexId: mode.vertexStart,
                  endVertexId: v.vertex.id,
                  geometry: newMode.itineraire,
                  mobilityType: MobilityType.bike,
                ),
              ),
            );
            return true;
          case SketchEdition mode:
            // On est en train d'éditer un segment
            // On vient de rencontrer un nouveau vertex
            // On met à jour le vertex de fin et l'itinéraire si possible
            return true;
        }
      case (SketchMode m, MapSketchPencil _, MapElement s)
          when m.correction != null && !m.correction!.armed:
        // Arme la correction
        final correction = m.correction!;
        if (s is! MapSketchSegment) {
          mode = m.copyWith(correction: correction.copyWith(armed: true));
        }
        return false;

      case (SketchMode m, MapSketchPencil _, MapSketchSegment _)
          when m.correction != null && m.correction!.armed:
        //Collision avec le sketchSegment
        print("sketch pencil collision with SegmentSketch");
        mode = m.mergeCorrection();
        return true;

      case _:
        return false;
    }
  }
}
