import 'package:map_engine/map_engine.dart';
import 'package:vamos_cartographie/map_editor/domain/domain.dart';

abstract class MapEditorStateTransitions {
  const MapEditorStateTransitions();
  MapCameraController? get cameraController;
  MapEditorState get mapState;
  set mapState(MapEditorState value);
}
