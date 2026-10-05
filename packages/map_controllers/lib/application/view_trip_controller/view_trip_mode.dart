import 'package:map_engine/map_engine.dart';

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
