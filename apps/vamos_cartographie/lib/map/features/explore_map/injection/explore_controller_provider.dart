import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_explore_application/map_explore_application.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/map/map.dart';
part 'explore_controller_provider.g.dart';

@Riverpod(keepAlive: true, dependencies: [mapContext])
class MapExplore extends _$MapExplore {
  late final MapExploreController controller;

  @override
  MapExploreMode build() {
    controller = MapExploreController(
      camera: ref.read(mapContextProvider.select((s) => s.camera)),
      onModeChanged: (mode) => state = mode,
    );
    return const MapExploreMode();
  }
}
