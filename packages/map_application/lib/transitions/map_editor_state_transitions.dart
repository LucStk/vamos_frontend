import 'package:map_application/domain/map_editor_state.dart';

abstract class MapEditorStateTransitions {
  const MapEditorStateTransitions();
  MapEditorState get mapState;
  set mapState(MapEditorState value);
}
