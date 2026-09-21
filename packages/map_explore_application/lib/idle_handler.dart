import 'package:map_application/domain/base_mode_model.dart';
import 'package:map_application/domain/gesture_result_model.dart';
import 'package:map_engine/controller/domain/map_gesture.dart';
import 'package:map_engine/visual/domain/map_objects.dart';
import 'package:map_explore_application/map_explore_mode.dart';

final class IdleHandler extends NoopGestureHandler<MapExploreMode> {
  const IdleHandler(this.mode);

  @override
  final Idle mode;

  @override
  GestureResult<MapExploreMode> onTap(TapGesture g) => switch (g.element) {
    TopologyObject e => GestureResult(mode: mode.withSelection(e as MapObject)),
    null => GestureResult(mode: mode.withSelection(null)),
    _ => GestureResult.none(),
  };
}
