import 'package:map_application/map_application.dart';
import 'package:map_editor_application/map_editor.dart';
import 'package:map_engine/map_engine.dart';

base mixin MapEditorTapGesture on BaseController<MapEditorMode> {
  @override
  void handleTap(TapGesture gesture) {
    switch ((mode, gesture.element)) {
      case (SketchMode m, MapSketchPencil p):
        mode = m.copyWith(selection: p);
        return;

      case (Idle _, MapObject e) when e is TopologyObject:
        mode = Idle(selection: e);
        return;

      case (Idle _, null):
        mode = Idle();
        return;
      case _:
    }
  }
}
