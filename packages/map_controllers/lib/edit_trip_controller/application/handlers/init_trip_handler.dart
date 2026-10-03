import 'package:map_application/map_application.dart';
import 'package:map_engine/map_engine.dart';

import 'package:map_controllers/edit_trip_controller/edit_trip_controller.dart';

final class InitTripHandler extends IdleHandler<MapEditorMode> {
  const InitTripHandler(super.mode);

  @override
  GestureResult<MapEditorMode> onTap(TapGesture g) => switch (g.element) {
    MapUserLocation _ => () {
      return GestureResult(mode: mode.withPopupPosition(g.offset));
    }(),
    TopologyObject e => GestureResult(mode: mode.withSelection(e as MapObject)),
    null => GestureResult(mode: mode.withPopupPosition(g.offset)),
    _ => GestureResult.none(),
  };
}
