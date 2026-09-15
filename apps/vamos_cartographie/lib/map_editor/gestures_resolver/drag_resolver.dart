import 'dart:async';
import 'dart:ui';

import 'package:map_engine/map_engine.dart';
import 'package:map_engine/pointer_events_resolver/pointer_events_resolver_output.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map_editor/domain/domain.dart';
import 'package:vamos_cartographie/map_editor/effects/map_effects.dart';
import 'package:vamos_cartographie/map_editor/gestures_resolver/gestures_resolver_input.dart';
import 'package:vamos_cartographie/map_editor/gestures_resolver/gestures_resolver_output.dart';
import 'gestures_resolver.dart';

extension PointerDragStartEditor on DragStartAction {
  GesturesResolverOutput resolve(GesturesResolverInput input) {
    switch ((input.editorState, element)) {
      case (SketchMode s, _) when s.selection is MapSketchPencil:
        return GesturesResolverOutput(editorState: s.copyWith(selection: null));
      case _:
        return GesturesResolverOutput(editorState: input.editorState);
    }
  }
}

extension PointerDragUpdateEditor on DragUpdateAction {
  GesturesResolverOutput resolve(GesturesResolverInput input) {
    final latLng = input.camera.screenOffsetToLatLng(offset);
    switch ((input.editorState, dragged, target)) {
      // Permet de faire bouger le vertex visuellement
      // case (Idle _, MapVertex e):
      //   final patch = VertexPatchModel(id: e.vertex.id, latLng: latLng);
      //   graphEditor.state = graphEditor.state.setVertex(patch);

      case (SketchMode m, MapSketchPencil _, MapObject? e):
        final itineraire = [...m.path, latLng];
        return GesturesResolverOutput(
          editorState: m.copyWith(path: itineraire, selection: e),
        );

      case _:
        return GesturesResolverOutput(editorState: input.editorState);
    }
  }
}

extension PointerDragEndEditor on DragEndAction {
  GesturesResolverOutput resolve(GesturesResolverInput input) {
    // final latLng = camera.screenOffsetToLatLng(offset);
    switch ((input.editorState, dragged, target)) {
      case (SketchCreation m, MapSketchPencil _, MapVertex v):
        // Le segment en cours de création viens de rencontrer un Vertex
        unawaited(
          mapEffects.createSegmentFromSketch(
            startVertexId: m.vertexStart,
            endVertexId: v.id,
            geometry: m.path,
            mobilityType: m.mobilityType,
          ),
        );
        editorState = m;

      case (SketchCreation m, MapSketchPencil _, MapSegment s):
        unawaited(
          mapEffects.spliceSegment(
            startAnchor: VertexAnchor(m.vertexStart),
            endAnchor: SegmentAnchor(s.id),
            correction: m.path,
            segmentId: s.id,
          ),
        );
        return;

      case (SketchEdition m, MapSketchPencil _, MapSegment s)
          when s.id == m.segmentId:
        // On est en train d'éditer un segment
        // On vient de rencontrer le même segment
        // L'utilisateur demande donc une correction de l'itineraire

        unawaited(
          mapEffects.correctSegmentFromSketch(
            segmentId: m.segmentId,
            correction: m.path,
          ),
        );
        editorState = m;

      case (SketchEdition m, MapSketchPencil _, TopologyObject s):
        // On est en train d'éditer un segment
        // On vient de rencontrer un autre segment/vertex
        // L'utilisateur demande donc une correction de l'itineraire

        unawaited(
          mapEffects.spliceSegment(
            startAnchor: SegmentAnchor(m.segmentId),
            endAnchor: s.anchor,
            correction: m.path,
            segmentId: m.segmentId,
          ),
        );
        return;
      case _:
        return;
    }
  }
