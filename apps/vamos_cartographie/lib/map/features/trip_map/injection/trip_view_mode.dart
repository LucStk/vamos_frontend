import 'package:map_engine/map_engine.dart';
import 'package:trip_application/trip_application.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '/map/camera/injection/map_camera_provider.dart';

part "trip_view_mode.g.dart";

@Riverpod(dependencies: [mapCamera])
class TripViewer extends _$TripViewer with ModeControllerMixin<ViewTripMode> {
  final _queue = EffectQueue();
  @override
  late ViewTripCommandResolver resolver;

  @override
  ModeState<ViewTripMode> build(TripId tripId) {
    final camera = ref.read(mapCameraProvider);
    resolver = ViewTripCommandResolver(camera);
    return ModeState(IdleView());
  }

  @override
  void setState(ModeState<ViewTripMode> newState) => state = newState;

  @override
  EffectQueue get effectQueue => _queue;
}
