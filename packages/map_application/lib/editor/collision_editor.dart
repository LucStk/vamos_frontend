import 'package:map_application/map_application.dart';
import 'package:trip_application/trip_application.dart';
import "dart:async";

extension CollisionEditor on MapEditor {
  bool onCollision(MapElement dragged, MapElement target) {
    switch ((mode, dragged, target)) {
      case (SketchCreation m, MapSketchPencil _, MapVertex v):
        print("collision with vertex");

        SketchMode newMode = m.mergeCorrection();
        unawaited(
          runEffect(
            CreateSegmentFromSketch(
              startVertexId: m.vertexStart,
              endVertexId: v.vertex.id,
              geometry: newMode.itineraire,
              mobilityType: MobilityType.bike,
            ),
          ),
        );
        return true;

      case (SketchEdition m, MapSketchPencil _, MapVertex v):

        // On est en train d'éditer un segment
        // On vient de rencontrer un nouveau vertex
        // On met à jour le vertex de fin et l'itinéraire si possible
        return true;

      case (SketchCreation m, MapSketchPencil _, MapElement s)
          when m.correction != null && !m.correction!.armed:
        // Arme la correction
        final correction = m.correction!;
        if (s is! MapSketchSegment) {
          mode = m.copyWith(correction: correction.copyWith(armed: true));
        }
        return false;
      case (SketchEdition m, MapSketchPencil _, MapElement s)
          when m.correction != null && !m.correction!.armed:
        // Arme la correction
        final correction = m.correction!;
        if (s is! MapSegment) {
          mode = m.copyWith(correction: correction.copyWith(armed: true));
        }
        return false;

      case (SketchMode m, MapSketchPencil _, MapSketchSegment _)
          when m.correction != null && m.correction!.armed:
        //Collision avec le sketchSegment
        print("sketch pencil collision with SegmentSketch");
        mode = m.mergeCorrection();
        return true;

      case (SketchMode m, MapSketchPencil _, MapSegment s)
          when m.correction != null && m.correction!.armed:
        //Collision avec le sketchSegment
        print("sketch pencil collision with segment $s");
        return true;
      case _:
        return false;
    }
  }
}
