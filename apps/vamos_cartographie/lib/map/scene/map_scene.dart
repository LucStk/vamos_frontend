import 'package:map_canvas/map_canvas.dart';
import 'package:map_engine/map_engine.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/map/camera/map_camera_provider.dart';
import 'package:vamos_cartographie/map/engine/mode_machine.dart';
import 'package:vamos_cartographie/map/modes/modes.dart';
import 'package:vamos_cartographie/map/modes/route_edit/select_route/select_route_scene.dart';
// Adapte le chemin au fichier qui déclare `selectSpanScene`.
import 'package:vamos_cartographie/map/modes/route_edit/select_span/select_span_scene.dart';
import 'package:vamos_cartographie/map/objects/localization/providers/localization_item_provider.dart';
import 'package:vamos_cartographie/map/objects/pencil/pencil.dart';
import 'package:vamos_cartographie/map/objects/sketch_trace/sketch_trace.dart';
import 'package:vamos_cartographie/map/objects/route/route.dart';
import 'package:vamos_cartographie/map/objects/route/selection_handle/providers/selection_handle_provider.dart';
import 'package:vamos_cartographie/map/scene/map_layer.dart';
import 'package:vamos_cartographie/map/scene/scene_spec.dart';
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

/// Les scènes qui renvoient encore une `List<Layer>` sont enveloppées dans un
/// `SceneSpec` sans traits : on les migre une par une, quand l'une d'elles a
/// besoin de déclarer une mise en avant.
@Dependencies([
  selectionHandleItems,
  pencilItem,
  sketchTraceItem,
  sketchOriginItem,
  sketchEndItem,
  tmpOriginItem,
])
SceneSpec sceneFor(AppMode mode) => switch (mode) {
  ExploreMode() => SceneSpec(layers: exploreScene()),
  // Avant `TripMode` : SelectSpanMode en est un sous-type, il serait sinon
  // capturé par le cas générique.
  SelectSpanMode(:final tripId, :final mobilitySpanId) => selectSpanScene(
    tripId,
    mobilitySpanId,
  ),
  SelectRouteMode(:final tripId) => SceneSpec(layers: selectRouteScene(tripId)),
  SketchEdition(:final tripId) => SceneSpec(layers: sketchScene(tripId)),
  SketchGenerating(:final tripId) => SceneSpec(
    layers: sketchGeneratingScene(tripId),
  ),
  PlaceExistingTripOrigin(:final tripId) => SceneSpec(
    layers: placeExistingTripOriginScene(tripId),
  ),
  PlaceNewTripOrigin() => SceneSpec(layers: placeNewTripOriginScene()),
  TripMode(:final tripId) => SceneSpec(layers: tripEditScene(tripId)),
  _ => const SceneSpec(layers: []),
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
    for (final layer in [...baseLayers, ...sceneFor(mode).layers])
      ...layer(ref, camera),
  ];

  // Tri STABLE : `List.sort` ne l'est pas en Dart. À priorité égale, l'ordre
  // des couches doit être conservé, sinon les segments et les badges (qui
  // partagent le même objet, donc la même priorité) se mélangent.
  final order = List<int>.generate(items.length, (i) => i)
    ..sort((i, j) {
      final byPriority = items[j].object.hitPriority.compareTo(
        items[i].object.hitPriority,
      );
      return byPriority != 0 ? byPriority : i.compareTo(j);
    });
  return [for (final i in order) items[i]];
}

/// Traits de la scène : sélection globale du mode, plus la mise en avant
/// déclarée par la scène courante. Séparé de [sceneItems] pour qu'un
/// changement de sélection ne reconstruise pas la liste des items.
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
    modeSelection,
  ],
)
Map<Object, Set<VisualTrait>> sceneTraits(Ref ref, MapCameraController camera) {
  final mode = ref.watch(mapModeProvider);
  final selected = ref.watch(modeSelectionProvider);
  return mergeTraits([
    if (selected != null)
      {
        selected: {VisualTrait.selected},
      },
    for (final source in sceneFor(mode).traits) source(ref, camera),
  ]);
}

/// Scène courante. Vide tant que la carte n'est pas montée : `cameraOrNull`
/// vaut alors `null`, et `latLngToWorldOffset` (appelé par les items) lèverait
/// une exception.
@Riverpod(keepAlive: true, dependencies: [sceneItems, sceneTraits])
MapScene mapScene(Ref ref) {
  final camera = ref.watch(readyCameraProvider);
  if (camera == null) return const MapScene(items: []);
  return MapScene(
    items: ref.watch(sceneItemsProvider(camera)),
    traits: ref.watch(sceneTraitsProvider(camera)),
  );
}
