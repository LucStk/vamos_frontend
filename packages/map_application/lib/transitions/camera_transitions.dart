import 'dart:ui';
import 'package:map_application/transitions/map_editor_state_transitions.dart';

extension CameraTransitions on MapEditorStateTransitions {
  void zoomTo(Offset offset) {
    if (cameraController == null) return;
    final latLng = cameraController!.screenOffsetToLatLng(offset);
    cameraController!.zoomTo(latLng);
  }
}
