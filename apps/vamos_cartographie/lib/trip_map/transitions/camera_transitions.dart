import 'package:map_engine/domain/offset_type.dart';
import 'package:vamos_cartographie/trip_map/transitions/trip_map_state_transitions.dart';

extension CameraTransitions on TripMapStateTransitions {
  void zoomTo(WorldOffset offset) {
    if (cameraController == null) return;
    final latLng = cameraController!.worldOffsetToLatLng(offset);
    cameraController!.zoomTo(latLng);
  }
}
