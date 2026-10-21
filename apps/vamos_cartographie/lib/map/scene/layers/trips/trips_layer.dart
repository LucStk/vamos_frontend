import 'package:domain_core/domain/collection_store.dart';
import 'package:map_engine/map_engine.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:riverpod/riverpod.dart';
import 'package:vamos_cartographie/domain_features/trip/injection/trip_store.dart';
import 'package:vamos_cartographie/map/scene/items/trip/trip_item.dart';
import 'package:vamos_cartographie/map/scene/layers/trips/trip_item_provider.dart';
part 'trips_layer.g.dart';

@Riverpod(keepAlive: true)
List<TripItem> allTripItem(Ref ref, MapCameraController camera) {
  final tripsIds = ref.watch(
    tripStoreProvider.select((t) => t.tripStore.getIds()),
  );
  return [
    for (final tripId in tripsIds) ?ref.watch(tripItemProvider(tripId, camera)),
  ];
}
