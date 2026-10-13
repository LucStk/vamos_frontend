import 'package:map_engine/map_engine.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'map_mode.g.dart';

@Riverpod(keepAlive: true, dependencies: [])
Mode mapMode(Ref ref) => throw UnimplementedError();

@Riverpod(keepAlive: true, dependencies: [])
Overlay? modeOverlay(Ref ref) => throw UnimplementedError();

@Riverpod(keepAlive: true, dependencies: [])
ModeState modeState(Ref ref) => throw UnimplementedError();

@Riverpod(keepAlive: true, dependencies: [])
ModeHost mapModeController(Ref ref) => throw UnimplementedError();

@Riverpod(dependencies: [mapCamera])
class ModeMachineNotifier extends _$ModeMachineNotifier
    with ModeMachine<MapExploreMode> {
  final _queue = EffectQueue();

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
