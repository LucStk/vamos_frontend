import 'package:map_application/map_application.dart';
import 'package:map_controllers/view_trip_controller/view_trip_mode.dart';
import 'package:map_engine/map_engine.dart';

final class ViewTripIdleHandler extends IdleHandler<ViewTripMode> {
  const ViewTripIdleHandler(super.mode);

  @override
  GestureResult<ViewTripMode> onTap(TapGesture g) {
    switch (g.element) {
      case MapObject e when !e.isSameAs(mode.selection):
        return GestureResult(mode: mode.withSelection(e));
      // case null:
      //   return GestureResult(mode: mode.withSelection(null));
      case _:
        return GestureResult.none();
    }
  }
}
