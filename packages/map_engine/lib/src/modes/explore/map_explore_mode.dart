import 'package:map_engine/map_engine.dart';

class MapExploreMode extends BaseMode<MapExploreMode> {
  const MapExploreMode({this.selection, this.popUpPosition});
  @override
  final MapTripObject? selection;
  @override
  final PopUpPositionType popUpPosition;

  @override
  MapExploreMode withSelection(MapObject? s) {
    if (s is MapTripObject) {
      return MapExploreMode(selection: s);
    }
    return this;
  }

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
