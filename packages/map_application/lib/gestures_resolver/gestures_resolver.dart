import 'package:map_application/map_application.dart';
import 'package:map_application/map_camera_controller.dart';

abstract class GesturesResolver {
  const GesturesResolver();
  MapEffects get mapEffects;
  MapCameraController get camera;

  MapEditorState get editorState;
  set editorState(MapEditorState value);
}
