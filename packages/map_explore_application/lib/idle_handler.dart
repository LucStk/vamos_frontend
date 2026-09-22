import 'package:map_application/map_application.dart';
import 'package:map_engine/controller/domain/map_gesture.dart';
import 'package:map_engine/visual/domain/map_objects.dart';
import 'package:map_explore_application/map_explore_mode.dart';

final class IdleHandler extends NoopGestureHandler<MapExploreMode> {
  const IdleHandler(this.mode);

  @override
  final Idle mode;

  @override
  GestureResult<MapExploreMode> onTap(TapGesture g) {
    switch (g.element) {
      case TopologyObject e:
        return GestureResult(mode: mode.withSelection(e));
      case null:
        return GestureResult(mode: mode.withSelection(null));
      case _:
        return GestureResult.none();
    }
  }
}
