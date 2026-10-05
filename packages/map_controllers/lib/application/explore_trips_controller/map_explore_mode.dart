import 'package:map_controllers/map_controllers.dart';
import 'package:map_engine/map_engine.dart';
import 'idle_handler.dart';

class MapExploreMode extends BaseMode<MapExploreMode> {
  const MapExploreMode({this.selection, this.popUpPosition});
  @override
  final MapTripObject? selection;
  @override
  final PopUpPositionType popUpPosition;

  MapExploreMode withSelection(MapTripObject? s) =>
      MapExploreMode(selection: s);

  @override
  ModeGestureHandler<MapExploreMode> get handler =>
      ExploreTripIdleHandler(this);
}
