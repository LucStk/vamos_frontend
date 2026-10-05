import 'package:map_controllers/map_controllers.dart';
import 'package:map_engine/map_engine.dart';

final class EditTripIdleHandler extends IdleHandler<MapEditorMode> {
  const EditTripIdleHandler(super.mode);

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
