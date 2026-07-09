import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_domain/application/queries/trip_query_handler.dart';
import 'package:trip_domain/trip_domain.dart';
import 'package:vamos_cartographie/core/injection/optimistic_executor_provider.dart';
import 'package:vamos_cartographie/media/injection/media_store.dart';
import 'package:vamos_cartographie/topology/injection/injection.dart';
import 'package:vamos_cartographie/waypoint/injection/injection.dart';
import 'trip_store.dart';
part 'trip_queries.g.dart';

@riverpod
Trip? trip(Ref ref, TripId tripId) {
  final tripStore = ref.watch(tripStoreProvider);
  return tripStore.get(tripId);
}

@riverpod
TripQueryHandler tripQueryHandler(Ref ref) {
  final graphStore = ref.read(rawGraphStoreProvider);
  final graphPatchStore = ref.read(rawGraphPatchStoreProvider);
  final tripStore = ref.read(rawTripStoreProvider);
  final mediaStore = ref.read(rawMediaStoreProvider);
  final tripRepo = ref.read(tripRepositoryProvider);
  final executor = ref.read(optimisticExecutorProvider);
  final waypointStore = ref.read(rawWaypointStoreProvider);
  return TripQueryHandler(
    graphStore: graphStore,
    graphPatchStore: graphPatchStore,
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
