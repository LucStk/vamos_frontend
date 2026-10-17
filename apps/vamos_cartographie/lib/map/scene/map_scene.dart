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

/// Items de la scène, en coordonnées MONDE.
///
/// La caméra n'est qu'une clé de famille : la projection monde est fixe
/// (`referenceZoom`), donc les items ne dépendent pas de l'état de la vue
/// (pan, zoom, rotation). Ce provider ne se recalcule pas quand la caméra
/// bouge ; c'est `CameraTransform` qui applique la matrice de vue.
@Riverpod(
  keepAlive: true,
  dependencies: [
    mapMode,
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
  }

  items.sort((a, b) => b.object.hitPriority.compareTo(a.object.hitPriority));
  return items;
}

/// Scène courante. Vide tant que la carte n'est pas montée : `cameraOrNull`
/// vaut alors `null`, et `latLngToWorldOffset` (appelé par les items) lèverait
/// une exception.
@Riverpod(keepAlive: true, dependencies: [sceneItems, cameraOrNull])
MapScene mapScene(Ref ref) {
  final selected = ref.watch(
    modeStateProvider.select((c) => c.slots.get(selectionSlot)),
  );
  final camera = ref.watch(cameraOrNullProvider);

  final List<SceneItem> items = camera == null
      ? const []
      : ref.watch(sceneItemsProvider(camera));
  return MapScene(selection: selected, items: items);
}
