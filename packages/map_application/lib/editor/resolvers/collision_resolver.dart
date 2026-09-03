import 'package:latlong2/latlong.dart';
import 'package:map_application/editor/utiles/merge_polyline.dart';
import 'package:map_application/map_application.dart';
import 'package:trip_application/trip_application.dart';
import "dart:async";

extension CollisionEditor on MapEditor {
  bool onCollision(MapElement dragged, MapElement target) {
    switch ((mode, dragged, target)) {
      case (SketchCreation m, MapSketchPencil _, MapSketchSegment _)
          when m.correction != null && m.correction!.armed:
        //Collision avec le sketchSegment en mode Creation

        print("sketch pencil collision with SegmentSketch");
        final List<LatLng> path = mergeCorrection(
          m.correction!.path,
          m.itineraire,
        );
        mode = m.copyWith(itineraire: path, correction: null);
        return true;

      case (SketchCreation m, MapSketchPencil _, MapVertex v):
        print("collision with vertex");

        List<LatLng> itineraire = m.itineraire;
        if (m.correction != null) {
          itineraire = addCorrection(m.correction!.path, itineraire);
        }

        unawaited(
          runEffect(
            CreateSegmentFromSketch(
              startVertexId: m.vertexStart,
              endVertexId: v.vertex.id,
              geometry: itineraire,
              mobilityType: MobilityType.bike,
            ),
          ),
        );
        return true;

      case (SketchEdition m, MapSketchPencil _, MapSegment s)
          when m.correction != null &&
              m.correction!.armed &&
              s.segmentId == m.segment.id:
        // On est en train d'éditer un segment
        // On vient de rencontrer le même segment
        // L'utilisateur demande donc une correction de l'itineraire
        print("collision with segment");

        List<LatLng> itineraire = mergeCorrection(
          m.correction!.path,
          m.segment.geometry,
        );
        final patch = SegmentPatchModel.fromFields(
          m.segment,
        ).copyWith(geometry: itineraire);
        unawaited(runEffect(EditeSegmentFromSketch(patch: patch)));
        return true;

      case (SketchEdition m, MapSketchPencil _, MapVertex v)
          when m.correction != null && m.correction!.armed:
        // On est en train d'éditer un segment
        // On vient de rencontrer un vertex
        // L'utilisateur demande donc une correction de l'itineraire
        print("collision with segment");

        List<LatLng> itineraire = addCorrection(
          m.correction!.path,
          m.segment.geometry,
        );

        final patch = SegmentPatchModel.fromFields(
          m.segment,
        ).copyWith(geometry: itineraire, endVertexId: v.vertex.id);

        unawaited(runEffect(EditeSegmentFromSketch(patch: patch)));
        return true;

      case (SketchCreation m, MapSketchPencil _, MapElement s)
          when m.correction != null && !m.correction!.armed:
        // Arme la correction
        final correction = m.correction!;
        if (s is! MapSketchSegment) {
          print("correction armed with $s");
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
      case _:
        return false;
    }
  }
}
