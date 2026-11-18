// scene_composition.dart
import 'package:map_engine/map_engine.dart';
import 'package:vamos_cartographie/map/modes/explore/ui/explore_ui.dart';
import 'package:vamos_cartographie/map/modes/mode_view.dart';
import 'package:vamos_cartographie/map/objects/annotations/providers/localization_item_provider.dart';
import 'package:vamos_cartographie/map/objects/annotations/providers/search_result_item_provider.dart';
import 'package:vamos_cartographie/map/objects/trip/providers/trips_layer.dart';
import 'package:vamos_cartographie/map/scene/scene_spec.dart';

ModeView exploreView(ExploreMode m) => ModeView(
  scene: SceneSpec(
    layers: [
      (ref, cam) => ref.watch(allTripItemProvider(cam)),
      (ref, cam) => [?ref.watch(localizationItemProvider(cam))],
      (ref, cam) => [?ref.watch(searchResultItemProvider(cam))],
    ],
  ),
  ui: () => ExploreUi(m),
);
