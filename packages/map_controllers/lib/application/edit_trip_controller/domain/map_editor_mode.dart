import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_controllers/map_controllers.dart';
import 'package:map_engine/map_engine.dart';
import 'package:trip_application/topology/domain/domain.dart';

part 'map_editor_mode.freezed.dart';

sealed class MapEditorMode extends BaseMode<MapEditorMode> {
  const MapEditorMode();
}

extension MapEditorModeCopy on MapEditorMode {
  MapEditorMode withPopupPosition(PopUpPositionType position) => switch (this) {
    IdleEditor m => m.copyWith(popUpPosition: position),
    InitTripMode m => m.copyWith(popUpPosition: position),
    SketchCreation m => m.copyWith(popUpPosition: position),
    SketchEdition m => m.copyWith(popUpPosition: position),
  };

  MapEditorMode withSelection(MapObject? selection) => switch (this) {
    IdleEditor m => m.copyWith(selection: selection),
    InitTripMode m => m.copyWith(selection: selection),
    SketchCreation m => m.copyWith(selection: selection),
    SketchEdition m => m.copyWith(selection: selection),
  };
}

@freezed
final class IdleEditor extends MapEditorMode with _$IdleEditor {
  const IdleEditor({this.selection, this.popUpPosition});

  @override
  final PopUpPositionType popUpPosition;

  @override
  final MapObject? selection;

  @override
  GestureResult<MapEditorMode> onTap(TapGesture g) => switch (g.element) {
    MapUserLocation _ => () {
      return GestureResult(mode: withPopupPosition(g.offset));
    }(),
    TopologyObject e => GestureResult(mode: withSelection(e as MapObject)),
    null => GestureResult(mode: withPopupPosition(g.offset)),
    _ => GestureResult.none(),
  };
}

@freezed
final class InitTripMode extends MapEditorMode with _$InitTripMode {
  const InitTripMode({this.selection, this.popUpPosition});

  @override
  final PopUpPositionType popUpPosition;

  @override
  final MapObject? selection;

  @override
  GestureResult<MapEditorMode> onTap(TapGesture g) => switch (g.element) {
    MapUserLocation _ => () {
      return GestureResult(mode: withPopupPosition(g.offset));
    }(),
    TopologyObject e => GestureResult(mode: withSelection(e as MapObject)),
    null => GestureResult(mode: withPopupPosition(g.offset)),
    _ => GestureResult.none(),
  };
}

/// Base commune : contrat partagé par SketchCreation et SketchEdition.
/// Pas de Freezed ici, donc pas de copyWith : les sous-classes l'implémentent.
sealed class SketchMode extends MapEditorMode {
  const SketchMode();

  List<LatLng> get path;
  VertexId? get touchedVertex;

  SketchMode withPath(List<LatLng> path);

  LatLng? get pencilPositionOrNull => path.isEmpty ? null : path.last;
  @override
  GestureResult<MapEditorMode> onTap(TapGesture g) => switch (g.element) {
    MapSketchPencil p => GestureResult(mode: withSelection(p)),
    _ => GestureResult.none(),
  };

  @override
  GestureResult<MapEditorMode> onDragStart(DragStartGesture g) {
    if (selection is! MapSketchPencil) return GestureResult.none();
    return GestureResult(mode: withSelection(null));
  }

  @override
  GestureResult<MapEditorMode> onDragging(DraggingGesture g, ScreenOffset p) {
    if (g.dragged is! MapSketchPencil) return GestureResult.none();
    return GestureResult(mode: withPath([...path, p]).withSelection(g.target));
  }
}

@freezed
abstract class SketchCreation extends SketchMode with _$SketchCreation {
  const SketchCreation._();

  const factory SketchCreation({
    required VertexId vertexStart,
    required List<LatLng> path,
    required MobilityType mobilityType,
    VertexId? touchedVertex,
    MapObject? selection,
    PopUpPositionType popUpPosition,
  }) = _SketchCreation;

  @override
  SketchCreation withPath(List<LatLng> path) => copyWith(path: path);

  @override
  GestureResult<MapEditorMode> onPointerDown(
    PointerDownGesture g,
    ScreenOffset p,
  ) {
    if (g.element is! MapSketchSegment) return GestureResult.none();
    final grab = closestPointOnPolyline(p, path);
    return GestureResult(
      mode: copyWith(path: path.sublist(0, grab.segmentIndex)),
    );
  }

  @override
  GestureResult<MapEditorMode> onDragEnd(DragEndGesture g) {
    if (g.dragged is! MapSketchPencil) return GestureResult.none();

    return switch (g.target) {
      MapVertex v => GestureResult(
        command: CreateSegmentFromSketch(
          startVertexId: vertexStart,
          endVertexId: v.id,
          geometry: path,
          mobilityType: mobilityType,
        ),
      ),
      MapSegment s => GestureResult(
        command: SpliceSegment(
          segmentId: s.id,
          correction: path,
          startAnchor: VertexAnchor(vertexStart),
          endAnchor: SegmentAnchor(s.id),
        ),
      ),
      null => GestureResult(
        command: CreateSegmentFromSketch(
          startVertexId: vertexStart,
          geometry: path,
          mobilityType: mobilityType,
        ),
      ),
      _ => GestureResult.none(),
    };
  }
}

@freezed
abstract class SketchEdition extends SketchMode with _$SketchEdition {
  const SketchEdition._();

  const factory SketchEdition({
    required SegmentId segmentId,
    required List<LatLng> path,
    VertexId? touchedVertex,
    MapObject? selection,
    PopUpPositionType popUpPosition,
  }) = _SketchEdition;

  @override
  SketchEdition withPath(List<LatLng> path) => copyWith(path: path);

  @override
  GestureResult<MapEditorMode> onPointerDown(
    PointerDownGesture g,
    ScreenOffset p,
  ) => switch (g.element) {
    MapSegment s when s.id == segmentId => GestureResult(
      mode: copyWith(path: [p]),
    ),
    _ => GestureResult.none(),
  };

  @override
  GestureResult<MapEditorMode> onDragEnd(DragEndGesture g) {
    final correct = GestureResult<MapEditorMode>(
      command: CorrectSegmentFromSketch(segmentId: segmentId, correction: path),
    );

    if (g.dragged is MapSketchPencil) return correct;

    return switch (g.target) {
      MapSegment s when s.id == segmentId => correct,
      TopologyObject s => GestureResult(
        command: SpliceSegment(
          segmentId: segmentId,
          correction: path,
          startAnchor: SegmentAnchor(segmentId),
          endAnchor: s.anchor,
        ),
      ),
      _ => GestureResult.none(),
    };
  }
}
