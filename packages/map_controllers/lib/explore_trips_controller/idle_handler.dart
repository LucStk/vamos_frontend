import 'package:map_application/map_application.dart';
import 'package:map_engine/map_engine.dart';
import 'map_explore_mode.dart';

final class ExploreTripIdleHandler extends IdleHandler<MapExploreMode> {
  const ExploreTripIdleHandler(super.mode);

  @override
  GestureResult<MapExploreMode> onTap(TapGesture g) {
    switch (g.element) {
      case MapTripObject e when !e.isSameAs(mode.selection):
        return GestureResult(mode: mode.withSelection(e));
      // case null:
      //   return GestureResult(mode: mode.withSelection(null));
      case _:
        return GestureResult.none();
    }
  }
}
