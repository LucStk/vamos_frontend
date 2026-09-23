import 'package:domain_core/domain_core.dart';
import 'package:map_canvas/map_canvas.dart';
import 'package:map_engine/map_engine.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip_application.dart';
import 'explore_controller_provider.dart';

import '/domain_features/domain_features.dart';
import '/map/engine/engine.dart';
part 'explore_scene.g.dart';

@riverpod
MapTripObject mapTripObject(Ref ref, TripId tripId) {
  final trip = ref.watch(tripProvider(tripId));
  if (trip == null) {
    throw NotFoundFailure(resourceId: tripId.toString(), resourceType: "Trip");
  }
  final tripSegment = ref.watch(allSegmentsProvider(tripId));
  // Applique la projection et l'aplatissement directement avec expand
  final tripGeometry = tripSegment.map((s) => s.geometry).toList();
  return MapTripObject(trip.id, tripGeometry);
}

@riverpod
ProjectedTrip projectTrip(Ref ref, TripId tripId) {
  final tripObject = ref.watch(mapTripObjectProvider(tripId));
  final cameraReader = ref.read(mapCameraHolderProvider);
  return ProjectedTrip(
    worldSegments: projectPolyline(
      tripObject.lines,
      cameraReader.latLngToWorldOffset,
    ),
    object: tripObject,
  );
}

@riverpod
List<ProjectedObject> projectedExploreScene(Ref ref) {
  final userLocation = ref.watch(userLocationProjectionProvider);
  final tripsIds = ref.watch(
    tripStoreProvider.select((t) => t.tripStore.getIds()),
  );

  final objects = <ProjectedObject>[...userLocation];

  for (final tripId in tripsIds) {
    objects.add(ref.watch(projectTripProvider(tripId)));
  }

  objects.sort((a, b) => b.object.hitPriority.compareTo(a.object.hitPriority));

  return objects;
}

@Riverpod(keepAlive: true)
MapScene exploreScene(Ref ref) {
  final id = ref.watch(exploreModeProvider.select((m) => m.tripSelect));
  final selection = id == null ? null : ref.watch(mapTripObjectProvider(id));
  final projectScene = ref.watch(projectedExploreSceneProvider);
  return MapScene(selection: selection, objects: projectScene);
}
