import 'package:map_engine/map_engine.dart';

abstract class MapEditorStateTransitions {
  const MapEditorStateTransitions();
  MapCameraController? get cameraController;
  MapEditorState get mapState;
  set mapState(MapEditorState value);
}
