export 'drag_resolver.dart';
export 'pointer_down_resolver.dart';
export 'tap_resolver.dart';
import 'package:map_application/map_application.dart';
import 'package:map_application/transitions/map_editor_state_transitions.dart';

abstract class GesturesResolver {
  const GesturesResolver();
  MapEffects get mapEffects;
  MapEditorStateTransitions get mapTransitions;
  MapCameraReader get camera;

  MapEditorState get editorState;
  set editorState(MapEditorState value);
}
