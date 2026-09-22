import 'package:map_application/map_application.dart';
import 'package:map_engine/visual/domain/domain.dart';
import 'package:map_explore_application/idle_handler.dart';
import 'package:trip_application/trip/trip.dart';

class MapExploreMode extends BaseMode<MapExploreMode> {
  const MapExploreMode({this.tripSelect});

  final TripId? tripSelect;

  MapExploreMode withSelection(MapTripObject? s) =>
      MapExploreMode(tripSelect: s?.id);

  @override
  ModeGestureHandler<MapExploreMode> get handler => IdleHandler(this);
}
