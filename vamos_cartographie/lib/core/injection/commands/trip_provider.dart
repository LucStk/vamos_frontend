import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_domain/trip_domain.dart';

import '/core/injection/stores/media_store.dart';
import '/core/injection/optimistic_executor_provider.dart';
import '/core/injection/stores/trip_store.dart';
part 'trip_provider.g.dart';

@riverpod
TripHandler tripHandler(Ref ref) {
  final store = ref.watch(rawTripStoreProvider);
  final mediaStore = ref.watch(rawMediaStoreProvider);
  final repo = ref.watch(tripRepositoryProvider);
  final executor = ref.watch(optimisticExecutorProvider);
  return TripHandler(store, mediaStore, repo, executor);
}

// core/injection/commands/trip_provider.dart
@riverpod
Future<void> loadTrips(Ref ref) async {
  final handler = ref.watch(tripHandlerProvider);
  final result = await handler.loadFromRemote();
  result.fold(
    (failure) => throw failure, // Riverpod capture ça en AsyncError
    (_) => null,
  );
}

// // Déclenché une fois à l'ouverture de l'explorer
// @riverpod
// Future<void> loadTripContext(LoadTripContextRef ref, TripId tripId) async {
//   await Future.wait([
//     ref.watch(loadWaypointsProvider(tripId).future),
//     ref.watch(loadTopologyProvider(tripId).future),
//   ]);
// }
