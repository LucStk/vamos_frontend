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
