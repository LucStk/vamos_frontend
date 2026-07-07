import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_domain/application/queries/trip_query_handler.dart';
import 'package:trip_domain/trip_domain.dart';
import 'package:vamos_cartographie/core/injection/media/media_injection.dart';
import 'package:vamos_cartographie/core/injection/optimistic_executor_provider.dart';
import 'package:vamos_cartographie/core/injection/trip_domain/providers/providers.dart';
part 'trip_domain_queries.g.dart';

@riverpod
Trip? trip(Ref ref, TripId tripId) {
  final tripStore = ref.watch(tripStoreProvider);
  return tripStore.get(tripId);
}

@riverpod
Waypoint? waypointFromVertex(Ref ref, VertexId vertexId) {
  final store = ref.watch(waypointStoreProvider);
  debugPrint("keys in vertexIndex: ${store.vertexIndex.keys.toList()}");
  debugPrint("looking for: $vertexId (hash: ${vertexId.hashCode})");

  return store.getFromVertex(vertexId);
}

@riverpod
TripQueryHandler tripQueryHandler(Ref ref) {
  final graphStore = ref.read(rawGraphStoreProvider);
  final tripStore = ref.read(rawTripStoreProvider);
  final mediaStore = ref.read(rawMediaStoreProvider);
  final tripRepo = ref.read(tripRepositoryProvider);
  final executor = ref.read(optimisticExecutorProvider);
  final waypointStore = ref.read(rawWaypointStoreProvider);
  return TripQueryHandler(
    graphStore: graphStore,
    mediaStore: mediaStore,
    tripStore: tripStore,
    tripRepo: tripRepo,
    executor: executor,
    waypointStore: waypointStore,
  );
}

@riverpod
Future<void> loadTrips(Ref ref) async {
  await ref.read(tripQueryHandlerProvider).loadFromRemote();
}
