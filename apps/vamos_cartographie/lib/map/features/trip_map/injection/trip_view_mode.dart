import 'package:map_engine/map_engine.dart';
import 'package:trip_application/trip_application.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part "trip_view_mode.g.dart";

@riverpod
class TripViewer extends _$TripViewer with ModeControllerMixin<ViewTripMode> {
  final _queue = EffectQueue();
  @override
  late ViewTripCommandResolver resolver;

  @override
  ViewTripMode build(TripId tripId) {
    resolver = ViewTripCommandResolver();
    return IdleView();
  }

  @override
  ViewTripMode get mode => state;

  @override
  void setMode(ViewTripMode mode) {
    state = mode;
  }

  @override
  EffectQueue get effectQueue => _queue;
}
