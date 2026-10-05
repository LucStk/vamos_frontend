import 'package:map_controllers/map_controllers.dart';
import 'package:map_engine/map_engine.dart';

class MapExploreMode extends BaseMode<MapExploreMode> {
  const MapExploreMode({this.selection, this.popUpPosition});
  @override
  final MapTripObject? selection;
  @override
  final PopUpPositionType popUpPosition;

  MapExploreMode withSelection(MapTripObject? s) =>
      MapExploreMode(selection: s);

  @override
  GestureResult<MapExploreMode> onTap(TapGesture g) {
    switch (g.element) {
      case MapTripObject e when !e.isSameAs(selection):
        return GestureResult(mode: withSelection(e));
      // case null:
      //   return GestureResult(mode: mode.withSelection(null));
      case _:
        return GestureResult.none();
    }
  }
}
