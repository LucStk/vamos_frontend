import 'package:map_engine/map_engine.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip/trip.dart';
import 'package:vamos_cartographie/trip_map/trip_map.dart';
import 'package:vamos_cartographie/trip_map/transitions/trip_map_state_transitions.dart';
import 'package:vamos_cartographie/base_map/base_map.dart';
// Généré automatiquement par riverpod_generator
part 'map_transitions.g.dart';

@Riverpod(keepAlive: true)
class TripMapStateTransitionsNotifier extends _$TripMapStateTransitionsNotifier
    implements TripMapStateTransitions {
  @override
  void build(TripId tripId) {
    _tripId = tripId;
  }

  late final TripId _tripId;

  @override
  MapCameraController? get cameraController =>
      ref.read(mapCameraControllerOrNullProvider);

  @override
  TripMapState get mapState => ref.read(tripMapStateProvider(_tripId));

  @override
  set mapState(TripMapState value) {
    ref.read(tripMapStateProvider(_tripId).notifier).state = value;
  }
}
