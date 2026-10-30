import 'package:map_canvas/map_canvas.dart';
import 'package:map_engine/map_engine.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/map/camera/map_camera_provider.dart';
import 'package:vamos_cartographie/map/mode_machine/map_mode.dart';
import 'package:vamos_cartographie/map/modes/modes.dart';
import 'package:vamos_cartographie/map/scene/layers/localization_layer.dart';
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

@Dependencies([allSketchItem, allSegmentItem])
List<Layer> layersFor(AppMode mode) => switch (mode) {
  ExploreMode() => exploreScene(),
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
  dependencies: [mapMode, allSegmentItem, allSketchItem],
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
@Riverpod(keepAlive: true, dependencies: [sceneItems])
MapScene mapScene(Ref ref) {
  final selected = ref.watch(
    modeStateProvider.select((c) => c.slots.get(selectionSlot)),
  );
  final camera = ref.watch(readyCameraProvider);

  final List<SceneItem> items = camera == null
      ? const []
      : ref.watch(sceneItemsProvider(camera));
  return MapScene(selection: selected, items: items);
}
