import 'package:map_application/map_application.dart';
import 'package:map_engine/map_engine.dart';
import 'package:map_explore_application/map_explore_mode.dart';

final class IdleHandler extends NoopGestureHandler<MapExploreMode> {
  const IdleHandler(this.mode);

  @override
  final MapExploreMode mode;

  @override
  GestureResult<MapExploreMode> onTap(TapGesture g) {
    switch (g.element) {
      case MapTripObject e when mode.tripSelect != e.id:
        return GestureResult(mode: mode.withSelection(e));
      case null:
        return GestureResult(mode: mode.withSelection(null));
      case _:
        return GestureResult.none();
    }
  }
}
