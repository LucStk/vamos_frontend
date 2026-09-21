import 'package:map_application/domain/base_mode_model.dart';
import 'package:map_engine/visual/visual.dart';
import 'package:map_explore_application/idle_handler.dart';

sealed class MapExploreMode extends BaseMode<MapExploreMode> {
  const MapExploreMode();
}

final class Idle extends MapExploreMode {
  const Idle({this.selection});

  @override
  final MapObject? selection;

  @override
  Idle withSelection(MapObject? s) => Idle(selection: s);

  @override
  ModeGestureHandler<MapExploreMode> get handler => IdleHandler(this);
}
