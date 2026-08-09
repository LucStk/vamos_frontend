import 'package:map_application/map_application.dart';
import 'package:trip_application/trip_application.dart';
import "dart:async";

extension CollisionEditor on MapEditor {
  bool onCollision(MapElement dragged, MapElement target) {
    switch ((mode, dragged, target)) {
      case (Sketch m, MapSketchPencil _, MapVertex v):
        unawaited(
          runEffect(
            CreateSegmentFromSketch(
              startVertexId: m.vertexStart,
              endVertexId: v.vertex.id,
              geometry: m.itineraire,
              mobilityType: MobilityType.bike,
            ),
          ),
        );
        return true;

      case (Sketch m, MapSketchPencil _, MapElement s)
          when m.correction != null:
        final correction = m.correction!;

        print("pencil in colision wth $s ");
        if (!correction.armed) {
          if (s is! MapSketchSegment) {
            mode = m.copyWith(correction: correction.copyWith(armed: true));
          }
          return false;
        }
        if (s is MapSketchSegment) {
          return true;
        }

        return false;

      case _:
        return false;
    }
  }
}
