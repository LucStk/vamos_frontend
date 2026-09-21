import 'package:latlong2/latlong.dart';
import 'package:map_application/domain/base_mode_model.dart';
import 'package:map_application/domain/gesture_result_model.dart';
import 'package:map_editor_application/domain/map_editor_mode.dart';
import 'package:map_engine/controller/domain/map_gesture.dart';
import 'package:map_engine/visual/domain/map_objects.dart';

abstract base class SketchHandler extends NoopGestureHandler<MapEditorMode> {
  const SketchHandler();

  @override
  SketchMode get mode;
  @override
  GestureResult<MapEditorMode> onTap(TapGesture g) => switch (g.element) {
    MapSketchPencil p => GestureResult(mode: mode.withSelection(p)),
    _ => GestureResult.none(),
  };

  @override
  GestureResult<MapEditorMode> onDragStart(DragStartGesture g) {
    if (mode.selection is! MapSketchPencil) return GestureResult.none();
    return GestureResult(mode: mode.withSelection(null));
  }

  @override
  GestureResult<MapEditorMode> onDragging(DraggingGesture g, LatLng p) {
    if (g.dragged is! MapSketchPencil) return GestureResult.none();
    return GestureResult(
      mode: mode.withPath([...mode.path, p]).withSelection(g.target),
    );
  }
}
