import 'package:map_engine/pointer_events_resolver/pointer_gesture_action.dart';
import 'package:vamos_cartographie/trip_map/domain/domain.dart';
import 'package:vamos_cartographie/trip_map/effects/map_effects.dart';

import 'gestures_resolver.dart';
import 'package:map_engine/map_engine.dart';

extension TapEditor on TapAction {
  GestureResolution resolve(GesturesResolverContext context) {
    switch ((context.editorState, element)) {
      case (Idle _, MapObject e) when e is TopologyObject:
        return GestureResolution(editorState: Idle(selection: e));

      case (SketchMode m, MapSketchPencil p):
        return GestureResolution(editorState: m.copyWith(selection: p));

      case (Idle _, null):
        return GestureResolution(editorState: Idle());

      case _:
        return GestureResolution(editorState: context.editorState);
    }
  }
}

extension DoubleTapEditor on DoubleTapAction {
  GestureResolution resolve(GesturesResolverContext context) {
    if (element == null) {
      return GestureResolution(
        editorState: context.editorState,
        effects: [ZoomToEffect(offset: offset)],
      );
    }

    return GestureResolution(editorState: context.editorState);
  }
}
