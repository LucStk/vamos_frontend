// scene_composition.dart
import 'package:vamos_cartographie/map/objects/annotations/providers/localization_item_provider.dart';
import 'package:vamos_cartographie/map/objects/annotations/providers/search_result_item_provider.dart';
import 'package:vamos_cartographie/map/objects/trip/providers/trips_layer.dart';
import 'package:vamos_cartographie/map/scene/map_layer.dart';

List<Layer> exploreScene() => [
  (ref, cam) => ref.watch(allTripItemProvider(cam)),
  (ref, cam) => [?ref.watch(localizationItemProvider(cam))],
  (ref, cam) => [?ref.watch(searchResultItemProvider(cam))],
];
