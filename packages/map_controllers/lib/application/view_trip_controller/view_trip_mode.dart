import 'package:map_engine/map_engine.dart';
import 'package:map_controllers/map_controllers.dart';

class ViewTripMode extends BaseMode<ViewTripMode> {
  const ViewTripMode({this.selection, this.popUpPosition});
  @override
  final MapObject? selection;
  @override
  final PopUpPositionType popUpPosition;

  ViewTripMode withSelection(MapObject? s) => ViewTripMode(selection: s);

  @override
  ModeGestureHandler<ViewTripMode> get handler => ViewTripIdleHandler(this);
}
