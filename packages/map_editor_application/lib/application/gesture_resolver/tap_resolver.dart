import 'package:map_application/map_application.dart';
import 'package:map_editor_application/map_editor.dart';
import 'package:map_engine/map_engine.dart';

GestureResult<MapEditorMode> handleTap(MapEditorMode mode, TapGesture gesture) {
  switch ((mode, gesture.element)) {
    case (SketchMode m, MapSketchPencil p):
      return GestureResult(mode: m.copyWith(selection: p));

    case (Idle _, MapObject e) when e is TopologyObject:
      return GestureResult(mode: Idle(selection: e));

    case (Idle _, null):
      return GestureResult(mode: Idle());
    case _:
      return GestureResult();
  }
}
