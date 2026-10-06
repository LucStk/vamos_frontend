import 'package:domain_core/domain/collection_store.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_engine/map_engine.dart';
import 'package:trip_application/trip_application.dart';
part "sketch_creation_mode.dart";
part "sketch_edition_mode.dart";
part "init_mode.dart";
part "idle_editor_mode.dart";
part "vertex_select_mode.dart";
part "segment_select_mode.dart";
part 'map_editor_mode.freezed.dart';

sealed class EditorCommand extends ModeCommand<MapEditorMode> {
  const EditorCommand();
}

sealed class MapEditorMode extends BaseMode<MapEditorMode> {
  const MapEditorMode();
}

mixin GraphReader {
  GraphEditor get graphEditor;

  SegmentFields? segment(SegmentId id) =>
      graphEditor.state.segmentStore.get(id)?.current;
}

mixin SketchMode on MapEditorMode {
  List<LatLng> get path;
  VertexId? get touchedVertex;
  MapObject? get selection;

  SketchMode withPath(List<LatLng> path);

  SketchMode withSelection(MapObject? selection);

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
    return GestureResult(
      mode: withSelection(g.target),
      command: AddPointToSketchSegment(p),
    );
  }
}
