import 'package:map_editor_application/map_editor.dart';
import 'package:map_engine/map_engine.dart';

extension TapEditor on MapEditorController {
  void tapResolve(TapGesture gesture) {
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
