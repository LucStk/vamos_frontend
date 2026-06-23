import 'package:domain_core/domain_core.dart';
import 'package:trip_domain/application/repositories/trip_repository.dart';
import 'package:trip_domain/domain/domain.dart';
import 'package:trip_domain/runtime/store/media_store.dart';
import "package:trip_domain/runtime/store/trip_store.dart";

import 'package:domain_core/optimitic_executor.dart';

class TripHandler {
  TripStore tripStore;
  MediaStore mediaStore;
  TripRepository repo;
  OptimisticExecutor executor;

  TripHandler(this.tripStore, this.mediaStore, this.repo, this.executor);

  void loadFromRemote() async {
    tripStore.clear();
    mediaStore.clear(); // ajout
    final result = await repo.getAllTrips();
    result.fold((failure) => throw Exception(failure.message), (
      List<Trip> trips,
    ) {
      for (final trip in trips) {
        tripStore.upsert(trip);
        for (final image in trip.images) {
          // ajout
          mediaStore.upsert(image);
        }
      }
    });
  }

  Future<void> createTrip(TripDraft draft) async {
    final result = await repo.createTrip(draft);

    result.fold(
      (f) => throw Exception(f.message),
      (trip) => tripStore.upsert(trip),
    );
  }

  Future<void> updateTrip(Id<Trip> id, TripDraft draft) async {
    final old = tripStore.getRequired(id);

    await executor.run(
      onApply: () => tripStore.upsert(draft.toTrip(id)),
      remote: () => repo.updateTrip(id, draft),
      onSuccess: (Trip serverTrip) => tripStore.upsert(serverTrip),
      onError: () => tripStore.upsert(old),
    );
  }

  Future<void> deleteTrip(Id<Trip> id) async {
    final old = tripStore.getRequired(id);
    await executor.run(
      onApply: () => tripStore.remove(id),
      remote: () => repo.deleteTrip(id),
      onSuccess: (_) {},
      onError: () => tripStore.upsert(old),
    );
  }
}
