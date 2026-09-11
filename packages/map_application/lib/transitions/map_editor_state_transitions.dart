import 'package:map_application/map_application.dart';

abstract class MapEditorStateTransitions {
  const MapEditorStateTransitions();
  MapCameraController? get cameraController;
  MapEditorState get mapState;
  set mapState(MapEditorState value);
}
