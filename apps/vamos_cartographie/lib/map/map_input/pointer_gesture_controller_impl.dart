import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_application/domain/domain.dart';
import 'package:map_application/gestures_resolver/gestures_resolver.dart';
import 'package:map_application/map_camera_controller.dart';
import 'package:map_application/pointer_events_resolver.dart';
import 'package:trip_application/trip/trip.dart';
import 'package:vamos_cartographie/map/injection/map_camera_controller_provider.dart';
import 'package:vamos_cartographie/map/injection/map_scene_provider.dart';
import 'package:vamos_cartographie/map/map_input/gesture_resolver_impl.dart';

class PointerGestureControllerImpl extends PointerGestureController {
  final WidgetRef _ref;
  final TripId _tripId;
  final void Function(bool blocked) _onPanBlockedChanged;

  PointerGestureControllerImpl({
    required WidgetRef ref,
    required TripId tripId,
    required void Function(bool blocked) onPanBlockedChanged,
  }) : _ref = ref,
       _tripId = tripId,
       _onPanBlockedChanged = onPanBlockedChanged;

  @override
  GesturesResolver get gesturesResolver =>
      GesturesResolverImpl(ref: _ref, tripId: _tripId);

  @override
  MapCameraController get camera => _ref.read(mapCameraControllerProvider);

  @override
  ProjectedScene get scene => _ref.read(projectedSceneProvider(_tripId));

  @override
  set setPanBlocked(bool blocked) => _onPanBlockedChanged(blocked);
}
