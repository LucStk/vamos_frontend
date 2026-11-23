// scene_composition.dart
import 'package:map_engine/map_engine.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/modes/mode_view.dart';
import 'package:vamos_cartographie/map/modes/place_origin/ui/place_origin_ui.dart';
import 'package:vamos_cartographie/map/objects/annotations/providers/search_result_item_provider.dart';
import 'package:vamos_cartographie/map/objects/route/route.dart';
import 'package:vamos_cartographie/map/scene/scene_spec.dart';

SceneSpec placeExistingTripOriginScene(TripId tripId) => SceneSpec(
  layers: [
    (ref, cam) => [?ref.watch(tripOriginItemProvider(tripId, cam))],
    (ref, cam) => [?ref.watch(searchResultItemProvider(cam))],
  ],
);
SceneSpec placeNewTripOriginScene() => SceneSpec(
  layers: [
    (ref, cam) => [?ref.watch(tmpOriginItemProvider(cam))],
  ],
);

ModeView placeExistingTripOriginView(PlaceExistingTripOrigin m) => ModeView(
  scene: placeExistingTripOriginScene(m.tripId),
  ui: () => PlaceOriginUi(m),
);

ModeView placeNewTripOriginView(PlaceNewTripOrigin m) =>
    ModeView(scene: placeNewTripOriginScene(), ui: () => PlaceOriginUi(m));
