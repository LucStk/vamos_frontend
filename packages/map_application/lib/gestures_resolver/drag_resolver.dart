import 'dart:async';

import 'package:latlong2/latlong.dart';
import 'package:map_application/gestures_resolver/gestures_resolver.dart';
import 'package:map_application/map_application.dart';
import 'package:map_application/utiles/merge_polyline.dart';
import 'package:trip_application/trip_application.dart';

extension DragEditor on GesturesResolver {
  void onDragStart({MapObject? element}) {
    switch ((editorState, element)) {
      case (SketchMode s, _) when s.selection is MapSketchPencil:
        editorState = s.copyWith(selection: null);
      case _:
    }
  }

  void onDragUpdate({
    MapObject? dragged,
    MapObject? target,
    required LatLng latLng,
  }) {
    switch ((editorState, dragged, target)) {
      // Permet de faire bouger le vertex visuellement
      // case (Idle _, MapVertex e):
      //   final patch = VertexPatchModel(id: e.vertex.id, latLng: latLng);
      //   graphEditor.state = graphEditor.state.setVertex(patch);

      case (SketchMode m, MapSketchPencil _, MapObject e)
          when m.correction != null:
        final correctionPath = [...m.correction!.path, latLng];
        editorState = m.copyWith(
          correction: m.correction!.copyWith(path: correctionPath),
          selection: e,
        );

      case (SketchCreation m, MapSketchPencil _, MapObject e):
        final itineraire = [...m.itineraire, latLng];
        editorState = m.copyWith(itineraire: itineraire, selection: e);
      case _:
    }
  }

  void onDragEnd({
    MapObject? dragged,
    MapObject? target,
    required LatLng latLng,
  }) {
    switch ((editorState, dragged, target)) {
      case (SketchCreation m, MapSketchPencil _, MapVertex v):
        // Le segment en cours de création viens de rencontrer un Vertex

        List<LatLng> itineraire = m.itineraire;
        if (m.correction != null) {
          itineraire = addCorrection(m.correction!.path, itineraire);
        }

        unawaited(
          mapEffects.createSegmentFromSketch(
            startVertexId: m.vertexStart,
            endVertexId: v.id,
            geometry: itineraire,
            mobilityType: m.mobilityType,
          ),
        );
        editorState = m;

      case (SketchCreation m, MapSketchPencil _, MapSegment s):
        print("sektche segment splice with ${s.id}");
        unawaited(
          mapEffects.spliceSegment(
            startAnchor: VertexAnchor(m.vertexStart),
            endAnchor: SegmentAnchor(s.id),
            correction: m.itineraire,
            mobilityType: m.mobilityType,
          ),
        );
        return;

      case (SketchCreation m, MapSketchPencil _, MapSketchSegment _)
          when m.hasCorrection:
        //Collision avec le sketchSegment en mode Creation

        print("sketch pencil collision with SegmentSketch");
        final List<LatLng> path = mergeCorrection(
          m.correction!.path,
          m.itineraire,
        );
        editorState = m.copyWith(itineraire: path, correction: null);

      case (SketchEdition m, MapSketchPencil _, MapSegment s)
          when m.hasCorrection && s.id == m.segment.id:
        // On est en train d'éditer un segment
        // On vient de rencontrer le même segment
        // L'utilisateur demande donc une correction de l'itineraire

        List<LatLng> itineraire = mergeCorrection(
          m.correction!.path,
          m.segment.geometry,
        );
        final patch = SegmentPatchModel.fromFields(
          m.segment,
        ).copyWith(geometry: itineraire);

        unawaited(
          mapEffects.correctSegmentFromSketch(
            patchSegment: patch,
            correction: m.correction!.path,
          ),
        );
        editorState = m;

      case (SketchEdition m, MapSketchPencil _, TopologyObject s)
          when m.hasCorrection:
        // On est en train d'éditer un segment
        // On vient de rencontrer un autre segment/vertex
        // L'utilisateur demande donc une correction de l'itineraire

        unawaited(
          mapEffects.spliceSegment(
            startAnchor: SegmentAnchor(m.segment.id),
            endAnchor: s.anchor,
            correction: m.correction!.path,
            mobilityType: m.segment.mobilityType,
          ),
        );
        return;
      case _:
        return;
    }
  }
}
