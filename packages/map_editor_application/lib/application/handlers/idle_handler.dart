import 'package:map_application/map_application.dart';
import 'package:map_editor_application/domain/map_editor_mode.dart';
import 'package:map_engine/map_engine.dart';

final class IdleHandler extends NoopGestureHandler<MapEditorMode> {
  const IdleHandler(this.mode);

  @override
  final Idle mode;

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
