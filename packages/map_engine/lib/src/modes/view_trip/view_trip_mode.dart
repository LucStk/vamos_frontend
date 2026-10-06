import '../../domain/gestures/map_gesture.dart';
import '../../domain/objects/map_objects.dart';
import '../../mode_machine/base_mode_model.dart';
import '../../mode_machine/gesture_result_model.dart';

class ViewTripMode extends BaseMode<ViewTripMode> {
  const ViewTripMode({this.selection, this.popUpPosition});
  @override
  final MapObject? selection;
  @override
  final PopUpPositionType popUpPosition;

  ViewTripMode withSelection(MapObject? s) => ViewTripMode(selection: s);

  @override
  GestureResult<ViewTripMode> onTap(TapGesture g) {
    switch (g.element) {
      case MapObject e when !e.isSameAs(selection):
        return GestureResult(mode: withSelection(e));
      // case null:
      //   return GestureResult(mode: mode.withSelection(null));
      case _:
        return GestureResult.none();
    }
  }
}
