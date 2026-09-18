import 'package:domain_core/domain/collection_store.dart';
import 'package:map_engine/map_engine.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/trip/injection/trip_store.dart';
import 'package:vamos_cartographie/trip_map/injection/topology_projecter.dart';

import 'package:vamos_cartographie/base_map/base_map.dart';
part 'explore_scene.g.dart';

@riverpod
ProjectedScene projectedExploreScene(Ref ref) {
  final userLocation = ref.watch(userLocationProjectionProvider);
  final tripsIds = ref.watch(
    tripStoreProvider.select((t) => t.tripStore.getIds()),
  );

  final objects = <ProjectedObject>[...userLocation];

  for (final tripId in tripsIds) {
    objects.addAll(ref.watch(allVertexProjectionProvider(tripId)));
    objects.addAll(ref.watch(allSegmentProjectionProvider(tripId)));
  }

  objects.sort((a, b) => b.object.hitPriority.compareTo(a.object.hitPriority));

  return ProjectedScene(objects);
}

@riverpod
MapScene exploreScene(Ref ref) {
  final selection = ref.watch(baseModeProvider.select((m) => m.selection));
  final projectScene = ref.watch(projectedExploreSceneProvider);
  return MapScene(selection: selection, projectedScene: projectScene);
}
