export 'drag_resolver.dart';
export 'pointer_down_resolver.dart';
export 'tap_resolver.dart';
import 'package:map_engine/map_engine.dart';
import 'package:map_engine/pointer_events_resolver/pointer_events_resolver_output.dart';
import 'package:vamos_cartographie/map_editor/domain/domain.dart';
import 'package:vamos_cartographie/map_editor/effects/map_effects.dart';
import 'package:vamos_cartographie/map_editor/transitions/map_editor_state_transitions.dart';

abstract class GesturesResolver {
  const GesturesResolver();
  MapEffects get mapEffects;
  MapEditorStateTransitions get mapTransitions;
  MapCameraReader get camera;

  MapEditorState get editorState;
  set editorState(MapEditorState value);

  void resolve(PointerGestureAction action) {
    switch (action) {
      case PointerDownAction():
      case TapAction():
      case DoubleTapAction():
      case DragStartAction():
      case DragUpdateAction():
      case DragEndAction():
    }
  }
}
