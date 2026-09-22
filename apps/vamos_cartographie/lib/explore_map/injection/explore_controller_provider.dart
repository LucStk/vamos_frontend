import 'package:map_explore_application/map_explore_application.dart';
import 'package:vamos_cartographie/base_map/base_map.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'explore_controller_provider.g.dart';

@Riverpod(keepAlive: true)
MapExploreController mapExploreController(Ref ref) {
  return MapExploreController(
    camera: ref.watch(mapCameraHolderProvider),
    onModeChanged: (mode) =>
        ref.read(exploreModeProvider.notifier).setState = mode,
  );
}

@Riverpod(keepAlive: true)
class ExploreModeNotifier extends _$ExploreModeNotifier {
  @override
  MapExploreMode build() => const MapExploreMode();
  set setState(MapExploreMode m) => state = m;
}
