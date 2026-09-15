import 'dart:ui';
import 'package:map_engine/gestures_resolver/gestures_resolver.dart';
import 'package:map_engine/map_engine.dart';
import 'package:map_engine/transitions/camera_transitions.dart';

extension TapEditor on GesturesResolver {
  void onTapped(MapObject? element, Offset offset) {
    switch ((editorState, element)) {
      case (Idle _, MapObject e) when e is TopologyObject:
        editorState = Idle(selection: e);

      case (SketchMode m, MapSketchPencil p):
        editorState = m.copyWith(selection: p);

      case (Idle _, null):
        editorState = Idle();
      case _:
    }
  }

  void onDoubleTapped(MapObject? element, Offset offset) {
    print("double tapped $element");
    if (element == null) {
      mapTransitions.zoomTo(offset);
    }
  }
}
