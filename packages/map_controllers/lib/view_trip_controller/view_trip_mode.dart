import 'package:map_application/base_mode_model.dart';
import 'package:map_controllers/view_trip_controller/idle_handler.dart';
import 'package:map_engine/domain/map_objects/map_objects.dart';

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
