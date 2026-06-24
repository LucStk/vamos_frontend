import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_domain/trip_domain.dart';
import '/core/injection/stores/trip_store.dart';
part 'trip_queries.g.dart';

@riverpod
Trip? trip(Ref ref, TripId tripId) {
  final tripStore = ref.watch(tripStoreProvider);
  return tripStore.get(tripId);
}
