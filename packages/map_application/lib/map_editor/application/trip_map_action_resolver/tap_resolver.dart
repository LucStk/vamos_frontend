import 'package:map_application/map_application.dart';

import 'gestures_resolver.dart';
import 'package:map_engine/map_engine.dart';

extension TapEditor on MapEditorController {
  GestureResolution resolve(MapObject? element) {
    switch ((mapState, element)) {
      case (Idle _, MapObject e) when e is TopologyObject:
        return GestureResolution(editorState: Idle(selection: e));

      case (SketchMode m, MapSketchPencil p):
        return GestureResolution(editorState: m.copyWith(selection: p));

      case (Idle _, null):
        return GestureResolution(editorState: Idle());

      case _:
        return GestureResolution(editorState: mapState);
    }
  }
}

extension DoubleTapEditor on DoubleTapAction {
  GestureResolution resolve(GestureResolutionContext context) {
    if (element == null) {
      return GestureResolution(
        editorState: context.editorState,
        effects: [ZoomToEffect(offset: offset)],
      );
    }

    return GestureResolution(editorState: context.editorState);
  }
}
