import 'package:map_application/map_application.dart';
import 'package:trip_application/trip_application.dart';
import "dart:async";

extension CollisionEditor on MapEditor {
  bool onCollision(MapElement dragged, MapElement target) {
    switch ((mode, dragged, target)) {
      case (SketchCreation m, MapSketchPencil _, MapVertex v):
        print("collision with vertex");
        SketchCreation new_mode = m.mergeCorrection();
        unawaited(
          runEffect(
            CreateSegmentFromSketch(
              startVertexId: new_mode.vertexStart,
              endVertexId: v.vertex.id,
              geometry: new_mode.itineraire,
              mobilityType: MobilityType.bike,
            ),
          ),
        );
        return true;

      case (SketchCreation m, MapSketchPencil _, MapElement s)
          when m.correction != null:
        final correction = m.correction!;

        if (!correction.armed) {
          if (s is! MapSketchSegment) {
            mode = m.copyWith(correction: correction.copyWith(armed: true));
          }
          return false;
        }
        if (s is MapSketchSegment) {
          print("sketch pencil collision with SegmentSketch");
          mode = m.mergeCorrection();
          return true;
        }

        return false;

      case _:
        return false;
    }
  }
}
