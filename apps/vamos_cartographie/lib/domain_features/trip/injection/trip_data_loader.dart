import 'package:domain_core/domain_core.dart';
import 'package:stored_file_application/application/stored_file_store.dart';
import 'package:trip_application/trip_application.dart';
import 'package:user_profile_application/application/application.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/domain_features/domain_features.dart';
import 'package:vamos_cartographie/domain_features/route/injection/providers/route_store.dart';

part 'trip_data_loader.g.dart';

@Riverpod(keepAlive: true)
Future<void> tripDetailsLoader(Ref ref, TripId tripId) async {
  final tripRepo = ref.watch(tripRepositoryProvider);
  final res = await tripRepo.getTripDetails(tripId);

  res.fold(
    (failure) =>
        throw failure, // L'erreur sera capturée par le framework Riverpod
    (data) {
      var newMediaStore = StoredFileStore.initial();

      for (final (w, listImages) in data.waypointsImages) {
        for (final i in listImages) {
          newMediaStore = newMediaStore.insertStoredFile(w.id, i);
        }
      }
      if (!ref.mounted) return;

      ref
          .read(waypointStoreProvider(tripId).notifier)
          .emit(WaypointStore.fromRemote(data.waypoints));
      ref
          .read(routeStoreProvider(tripId).notifier)
          .emit(
            RouteStore.fromRemote(route: data.route, sections: data.section),
          );
      ref.read(storedFileStoreProvider.notifier).emit(newMediaStore);
    },
  );
}

@riverpod
Future<Failure?> loadTripsNotifier(Ref ref) async {
  final tripRepo = ref.watch(tripRepositoryProvider);
  final res = await tripRepo.getAllTrips();

  return res.fold((Failure f) => f, (data) {
    var newProfileStore = ProfileStore.initial();
    var newStore = TripStore.initial();
    var newFileStore = StoredFileStore.initial();
    for (final (trip, user, listImages, section) in data) {
      newProfileStore = newProfileStore.insertProfile(user);
      newStore = newStore.insertTrip(trip);
      for (final i in listImages) {
        newFileStore = newFileStore.insertStoredFile(trip.id, i);
      }
      ref
          .read(routeStoreProvider(trip.id).notifier)
          .emit(RouteStore.fromRemote(route: route, sections: section));
    }
    ref.read(tripStoreProvider.notifier).emit(newStore);
    ref.read(storedFileStoreProvider.notifier).emit(newFileStore);
    ref.read(profileStoreProvider.notifier).emit(newProfileStore);
    return null;
  });
}
