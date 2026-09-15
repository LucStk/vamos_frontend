export 'drag_resolver.dart';
export 'pointer_down_resolver.dart';
export 'tap_resolver.dart';
import 'package:map_engine/map_engine.dart';
import 'package:vamos_cartographie/map_editor/domain/domain.dart';
import 'package:vamos_cartographie/map_editor/effects/map_effects.dart';
import 'package:vamos_cartographie/map_editor/transitions/map_editor_state_transitions.dart';

class GesturesResolverContext {
  const GesturesResolverContext({
    required this.editorState,
    required this.camera,
    required this.mapTransitions,
  });

  final MapEditorState editorState;
  final MapCameraReader camera;
  final MapEditorStateTransitions mapTransitions;
}

class GestureResolution {
  const GestureResolution({required this.editorState, this.effects = const []});

  final MapEditorState editorState;
  final List<MapEffect> effects;
}
