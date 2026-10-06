import '../../domain/gestures/map_gesture.dart';
import '../../domain/objects/map_objects.dart';
import '../../mode_machine/base_mode_model.dart';
import '../../mode_machine/gesture_result_model.dart';

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
      case _:
        return GestureResult.none();
    }
  }
}
