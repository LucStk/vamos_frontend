import 'package:map_engine/map_engine.dart';
import 'package:vamos_cartographie/trip_map/domain/trip_map_state.dart';

abstract class TripMapStateTransitions {
  const TripMapStateTransitions();
  MapCameraController? get cameraController;
  TripMapState get mapState;
  set mapState(TripMapState value);
}
