import 'package:map_application/map_application.dart';
import 'package:map_engine/map_engine.dart';

extension TapEditor on MapEditorController {
  void tapResolve(TapGesture gesture) {
    switch ((editorMode, gesture.element)) {
      case (Idle _, MapObject e) when e is TopologyObject:
        editorMode = Idle(selection: e);
        return;

      case (SketchMode m, MapSketchPencil p):
        editorMode = m.copyWith(selection: p);
        return;

      case (Idle _, null):
        editorMode = Idle();
        return;
      case _:
    }
  }
}
