import 'package:map_canvas/map_canvas.dart';
import 'package:map_engine/map_engine.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/map/camera/camera_or_null.dart';
import 'package:vamos_cartographie/map/mode/map_mode.dart';
import 'package:vamos_cartographie/map/scene/items/localization/localization_item_provider.dart';
import 'package:vamos_cartographie/map/scene/items/segment/segment_item_provider.dart';
import 'package:vamos_cartographie/map/scene/items/sketch_segment/sketch_item_provider.dart';
import 'package:vamos_cartographie/map/scene/items/trip/trip_item_provider.dart';
import 'package:vamos_cartographie/map/scene/items/vertex/vertex_item_provider.dart';

part 'map_scene.g.dart';

@Riverpod(
  keepAlive: true,
  dependencies: [
    mapMode,
    allTripItem,
    localizationItem,
    allSketchItem,
    allSegmentItem,
    allVertexItem,
  ],
)
List<SceneItem> sceneItems(Ref ref, MapCameraController camera) {
  final mode = ref.watch(mapModeProvider);
  final List<SceneItem> items = [?ref.watch(localizationItemProvider(camera))];

  switch (mode) {
    case ExploreMode _:
      items.addAll(ref.watch(allTripItemProvider(camera)));

    case SketchMode _:
      items.addAll(ref.watch(allSketchItemProvider(camera)));

    case TripMode e:
      items.addAll(ref.watch(allVertexItemProvider(e.tripId, camera)));
      items.addAll(ref.watch(allSegmentItemProvider(e.tripId, camera)));
      break;
  }

  items.sort((a, b) => b.object.hitPriority.compareTo(a.object.hitPriority));
  return items;
}

@Riverpod(keepAlive: true, dependencies: [CameraOrNull, sceneItems])
MapScene mapScene(Ref ref) {
  final selected = ref.watch(
    modeStateProvider.select((c) => c.slots.get(selectionSlot)),
  );
  final camera = ref.watch(cameraOrNullProvider);

  final List<SceneItem> items = (camera != null)
      ? ref.watch(sceneItemsProvider(camera))
      : [];

  return MapScene(selection: selected, items: items);
}
