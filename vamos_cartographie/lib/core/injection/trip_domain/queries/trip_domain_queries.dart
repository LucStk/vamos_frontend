import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_domain/application/queries/trip_query_handler.dart';
import 'package:trip_domain/trip_domain.dart';
import 'package:vamos_cartographie/core/injection/media/media_injection.dart';
import 'package:vamos_cartographie/core/injection/trip_domain/providers/trip_store.dart';
import 'package:vamos_cartographie/core/injection/trip_domain/providers/waypoint_store.dart';
part 'trip_domain_queries.g.dart';

@riverpod
Trip? trip(Ref ref, TripId tripId) {
  final tripStore = ref.watch(tripStoreProvider);
  return tripStore.get(tripId);
}

@riverpod
Waypoint? waypointFromVertex(Ref ref, VertexId vertexId) {
  final store = ref.watch(waypointStoreProvider);
  return store.getFromVertex(vertexId);
}

@riverpod
TripQueryHandler tripQueryHandler(Ref ref) {
  final graphStore = ref.read(rawTripStoreProvider);

  final mediaStore = ref.read(rawMediaStoreProvider);
  final repo = ref.read(tripRepositoryProvider);
  return TripQueryHandler(graphStore, mediaStore, repo);
}

@riverpod
Future<void> loadTrips(Ref ref) async {
  final result = await ref.read(tripQueryHandlerProvider).loadFromRemote();
  result.fold((failure) => throw failure, (_) => null);
}
