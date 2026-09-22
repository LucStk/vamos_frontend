import 'package:map_application/map_application.dart';
import 'package:map_explore_application/idle_handler.dart';
import 'package:trip_application/trip/domain/trip.dart';

sealed class MapExploreMode extends BaseMode<MapExploreMode> {
  const MapExploreMode();
}

final class Idle extends MapExploreMode {
  const Idle({this.tripSelect});

  final TripId? tripSelect;

  Idle withSelection(TripId? s) => Idle(tripSelect: s);

  @override
  ModeGestureHandler<MapExploreMode> get handler => IdleHandler(this);
}
