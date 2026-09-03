import 'dart:async';

import 'package:latlong2/latlong.dart';
import 'package:map_application/editor/utiles/merge_polyline.dart';
import 'package:map_application/map_application.dart';
import 'package:trip_application/trip_application.dart';

extension DragEditor on MapEditor {
  Future<void> onDragStart(MapElement element) async {}

  Future<void> onDragUpdate(
    MapElement dragged,
    MapElement target,
    LatLng latLng,
  ) async {
    switch ((mode, dragged, target)) {
      // Permet de faire bouger le vertex visuellement
      // case (Idle _, MapVertex e):
      //   final patch = VertexPatchModel(id: e.vertex.id, latLng: latLng);
      //   graphEditor.state = graphEditor.state.setVertex(patch);

      case (SketchMode m, MapSketchPencil _, MapElement e)
          when m.correction != null:
        final correctionPath = [...m.correction!.path, latLng];
        mode = m.copyWith(
          correction: m.correction!.copyWith(path: correctionPath),
        );
        selection = e;

      case (SketchCreation m, MapSketchPencil _, MapElement e):
        final itineraire = [...m.itineraire, latLng];
        mode = m.copyWith(itineraire: itineraire);
        selection = e;
      case _:
    }
  }

  Future<void> onDragEnd(
    MapElement dragged,
    MapElement? target,
    LatLng latLng,
  ) async {
    switch ((mode, dragged, target)) {
      // Permet de valider la nouvelle position du vertex sur le serveur
      // case (Idle _, MapVertex e):
      //   mode = Idle();
      //   await graphEditor.moveVertex(e.vertex.id, latLng);
      case (SketchCreation m, MapSketchPencil _, MapSketchSegment _)
          when m.correction != null && m.correction!.armed:
        //Collision avec le sketchSegment en mode Creation
        final List<LatLng> path = mergeCorrection(
          m.correction!.path,
          m.itineraire,
        );
        mode = m.copyWith(itineraire: path, correction: null);

      case (SketchCreation m, MapSketchPencil _, MapVertex v):
        // Le segment en cours de création viens de rencontrer un Vertex

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
      case (SketchCreation m, MapSketchPencil _, MapSketchSegment _)
          when m.correction != null && m.correction!.armed:
        //Collision avec le sketchSegment en mode Creation

        print("sketch pencil collision with SegmentSketch");
        final List<LatLng> path = mergeCorrection(
          m.correction!.path,
          m.itineraire,
        );
        mode = m.copyWith(itineraire: path, correction: null);

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

      case (SketchCreation m, MapSketchPencil _, MapElement s)
          when m.correction != null && !m.correction!.armed:
        // Arme la correction
        final correction = m.correction!;
        if (s is! MapSketchSegment) {
          print("correction armed with $s");
          mode = m.copyWith(correction: correction.copyWith(armed: true));
        }

      case (SketchEdition m, MapSketchPencil _, MapElement s)
          when m.correction != null && !m.correction!.armed:
        // Arme la correction
        final correction = m.correction!;
        if (s is! MapSegment) {
          mode = m.copyWith(correction: correction.copyWith(armed: true));
        }
      case _:
    }
  }
}
