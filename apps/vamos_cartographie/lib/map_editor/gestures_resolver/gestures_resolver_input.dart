import 'package:map_engine/map_camera_controller.dart';
import 'package:vamos_cartographie/map_editor/domain/map_editor_state.dart';

class GesturesResolverInput {
  const GesturesResolverInput({
    required this.camera,
    required this.editorState,
  });

  final MapCameraReader camera;
  final MapEditorState editorState;
}
