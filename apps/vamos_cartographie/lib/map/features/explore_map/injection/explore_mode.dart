import 'package:map_engine/map_engine.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../camera/injection/map_camera_provider.dart';

part "explore_mode.g.dart";

@Riverpod(dependencies: [mapCamera])
class MapExplore extends _$MapExplore with ModeControllerMixin<MapExploreMode> {
  final _queue = EffectQueue();
  @override
  late ExploreCommandResolver resolver;

  @override
  ModeState<MapExploreMode> build() {
    final camera = ref.read(mapCameraProvider);
    resolver = ExploreCommandResolver(camera);
    return ModeState(MapExploreMode());
  }

  @override
  void setState(ModeState<MapExploreMode> newState) => state = newState;

  @override
  EffectQueue get effectQueue => _queue;
}
