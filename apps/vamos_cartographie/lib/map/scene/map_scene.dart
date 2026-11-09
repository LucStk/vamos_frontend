import 'package:map_canvas/map_canvas.dart';
import 'package:map_engine/map_engine.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/map/camera/map_camera_provider.dart';
import 'package:vamos_cartographie/map/engine/mode_machine.dart';
import 'package:vamos_cartographie/map/modes/modes.dart';
import 'package:vamos_cartographie/map/modes/route_edit/select_route/select_route_scene.dart';
import 'package:vamos_cartographie/map/objects/localization/providers/localization_item_provider.dart';
import 'package:vamos_cartographie/map/objects/pencil/pencil.dart';
import 'package:vamos_cartographie/map/objects/sketch_trace/sketch_trace.dart';
import 'package:vamos_cartographie/map/objects/route/route.dart';
import 'package:vamos_cartographie/map/objects/route/selection_handle/providers/selection_handle_provider.dart';
import 'package:vamos_cartographie/map/scene/map_layer.dart';
import 'package:riverpod_annotation/experimental/scope.dart';
part 'map_scene.g.dart';

/// Items de la scène, en coordonnées MONDE.
///
/// La caméra n'est qu'une clé de famille : la projection monde est fixe
/// (`referenceZoom`), donc les items ne dépendent pas de l'état de la vue
/// (pan, zoom, rotation). Ce provider ne se recalcule pas quand la caméra
/// bouge ; c'est `CameraTransform` qui applique la matrice de vue.

final baseLayers = <Layer>[
  (ref, cam) => [?ref.watch(localizationItemProvider(cam))],
];

@Dependencies([
  selectionHandleItems,
  pencilItem,
  sketchTraceItem,
  sketchOriginItem,
  sketchEndItem,
  tmpOriginItem,
])
List<Layer> layersFor(AppMode mode) => switch (mode) {
  ExploreMode() => exploreScene(),
  SelectRouteMode(:final tripId) => selectRouteScene(tripId),
  SketchEdition(:final tripId) => sketchScene(tripId),
  SketchGenerating(:final tripId) => sketchGeneratingScene(tripId),
  PlaceExistingTripOrigin(:final tripId) => placeExistingTripOriginScene(
    tripId,
  ),
  PlaceNewTripOrigin() => placeNewTripOriginScene(),
  TripMode(:final tripId) => tripEditScene(tripId),
  _ => [],
};
@Riverpod(
  keepAlive: true,
  dependencies: [
    selectionHandleItems,
    pencilItem,
    sketchTraceItem,
    sketchOriginItem,
    sketchEndItem,
    tmpOriginItem,
    mapMode,
  ],
)
List<SceneItem> sceneItems(Ref ref, MapCameraController camera) {
  final mode = ref.watch(mapModeProvider);
  final items = [
    for (final layer in [...baseLayers, ...layersFor(mode)])
      ...layer(ref, camera),
  ];
  items.sort((a, b) => b.object.hitPriority.compareTo(a.object.hitPriority));
  return items;
}

/// Scène courante. Vide tant que la carte n'est pas montée : `cameraOrNull`
/// vaut alors `null`, et `latLngToWorldOffset` (appelé par les items) lèverait
/// une exception.
@Riverpod(keepAlive: true, dependencies: [sceneItems, modeSelection])
MapScene mapScene(Ref ref) {
  final selected = ref.watch(modeSelectionProvider);
  final camera = ref.watch(readyCameraProvider);

  final List<SceneItem> items = camera == null
      ? const []
      : ref.watch(sceneItemsProvider(camera));
  return MapScene(selection: selected, items: items);
}
