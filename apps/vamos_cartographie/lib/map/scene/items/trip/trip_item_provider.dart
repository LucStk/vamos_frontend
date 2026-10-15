import 'package:domain_core/domain/collection_store.dart';
import 'package:map_engine/map_engine.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:riverpod/riverpod.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/topology/injection/queries/segment_queries.dart';
import 'package:vamos_cartographie/domain_features/trip/injection/trip_store.dart';
import 'package:vamos_cartographie/map/scene/items/trip/trip_item.dart';
part 'trip_item_provider.g.dart';

@Riverpod(keepAlive: true)
TripItem tripItem(Ref ref, TripId tripId, MapCameraReader camera) {
  final tripSegment = ref.watch(allSegmentsProvider(tripId));
  final tripGeometry = tripSegment.map((s) => s.geometry).toList();
  return TripItem(
    worldSegments: projectPolyline(tripGeometry, camera.latLngToWorldOffset),
    object: MapTrip(tripId, isOwned: ref.watch(isTripOwnedProvider(tripId))),
  );
}

@Riverpod(keepAlive: true)
List<TripItem> allTripItem(Ref ref, MapCameraController camera) {
  final tripsIds = ref.watch(
    tripStoreProvider.select((t) => t.tripStore.getIds()),
  );
  return [
    for (final tripId in tripsIds) ref.watch(tripItemProvider(tripId, camera)),
  ];
}
