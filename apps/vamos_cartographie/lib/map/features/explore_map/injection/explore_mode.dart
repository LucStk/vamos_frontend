import 'package:map_engine/map_engine.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part "explore_mode.g.dart";

@riverpod
class MapExplore extends _$MapExplore with ModeControllerMixin<MapExploreMode> {
  final _queue = EffectQueue();
  @override
  late ExploreCommandResolver resolver;

  @override
  MapExploreMode build() {
    resolver = ExploreCommandResolver();
    return IdleExplorer();
  }

  @override
  MapExploreMode get mode => state;

  @override
  void setMode(MapExploreMode mode) {
    state = mode;
  }

  @override
  EffectQueue get effectQueue => _queue;
}
