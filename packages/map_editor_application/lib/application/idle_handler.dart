import 'package:map_application/map_application.dart';
import 'package:map_editor_application/domain/map_editor_mode.dart';
import 'package:map_engine/controller/domain/map_gesture.dart';
import 'package:map_engine/visual/domain/map_objects.dart';

final class IdleHandler extends NoopGestureHandler<MapEditorMode> {
  const IdleHandler(this.mode);

  @override
  final Idle mode;

  @override
  GestureResult<MapEditorMode> onTap(TapGesture g) => switch (g.element) {
    TopologyObject e => GestureResult(mode: mode.withSelection(e as MapObject)),
    null => GestureResult(mode: mode.withSelection(null)),
    _ => GestureResult.none(),
  };
}
