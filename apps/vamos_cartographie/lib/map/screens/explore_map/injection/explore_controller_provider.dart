import 'package:map_explore_application/map_explore_application.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/map/camera/camera.dart';
part 'explore_controller_provider.g.dart';

@Riverpod(keepAlive: true, dependencies: [MapCameraHolder])
MapExploreController mapExploreController(Ref ref) {
  return MapExploreController(
    camera: ref.read(mapCameraHolderProvider),
    onModeChanged: (mode) {
      print("mode changed ${mode.tripSelect}");
      ref.read(exploreModeProvider.notifier).setState = mode;
    },
  );
}

@Riverpod(keepAlive: true)
class ExploreModeNotifier extends _$ExploreModeNotifier {
  @override
  MapExploreMode build() => const MapExploreMode();
  set setState(MapExploreMode m) => state = m;
}
