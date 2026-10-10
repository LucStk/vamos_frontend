import 'package:domain_core/domain_core.dart';
import 'package:map_canvas/map_canvas.dart';
import 'package:map_engine/map_engine.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../camera/injection/camera_or_null.dart';
import '../../../injection/localization_item.dart';
import '../../../injection/map_mode.dart';
import '/domain_features/domain_features.dart';
import 'trip_item.dart';
part 'explore_scene.g.dart';

@Riverpod(dependencies: [CameraOrNull, localizationItem, tripItem])
List<SceneItem> exploreSceneItems(Ref ref) {
  final camera = ref.watch(cameraOrNullProvider);
  if (camera == null) return [];
  final userLocation = ref.watch(localizationItemProvider(camera));
  final List<SceneItem> items = [?userLocation];
  final tripsIds = ref.watch(
    tripStoreProvider.select((t) => t.tripStore.getIds()),
  );
  for (final tripId in tripsIds) {
    items.add(ref.watch(tripItemProvider(tripId, camera)));
  }
  items.sort((a, b) => b.object.hitPriority.compareTo(a.object.hitPriority));
  return items;
}

@Riverpod(dependencies: [exploreSceneItems, modeContext])
MapScene exploreScene(Ref ref) {
  final selected = ref.watch(
    modeContextProvider.select((c) => c.get(selectionSlot)),
  );
  final projectScene = ref.watch(exploreSceneItemsProvider);
  return MapScene(selection: selected, items: projectScene);
}
