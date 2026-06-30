import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_domain/trip_domain.dart';
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

// @riverpod
// Future<void> loadTrips(Ref ref) async {
//   final result = await ref.read(tripHandlerProvider).loadFromRemote();
//   result.fold((failure) => throw failure, (_) => null);
// }
