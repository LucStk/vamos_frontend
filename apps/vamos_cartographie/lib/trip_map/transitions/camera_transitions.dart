import 'dart:ui';

import 'package:vamos_cartographie/trip_map/transitions/trip_map_state_transitions.dart';

extension CameraTransitions on TripMapStateTransitions {
  void zoomTo(Offset offset) {
    if (cameraController == null) return;
    final latLng = cameraController!.screenOffsetToLatLng(offset);
    cameraController!.zoomTo(latLng);
  }
}
