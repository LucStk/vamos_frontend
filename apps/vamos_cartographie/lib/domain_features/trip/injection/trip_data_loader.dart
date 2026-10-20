import 'package:domain_core/domain_core.dart';
import 'package:stored_file_application/application/stored_file_store.dart';
import 'package:stored_file_application/domain/stored_file_model.dart';
import 'package:trip_application/trip_application.dart';
import 'package:user_profile_application/application/application.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/domain_features/domain_features.dart';
import 'package:vamos_cartographie/domain_features/route/injection/route_store.dart';

part 'trip_data_loader.g.dart';

@riverpod
Future<Failure?> loadTripsNotifier(Ref ref) async {
  final tripRepo = ref.watch(tripRepositoryProvider);
  final res = await tripRepo.getAllTrips();

  return res.fold((Failure f) => f, (data) {
    var newProfileStore = ProfileStore.initial();
    var newStore = TripStore.initial();
    final filesByOwner = <(Id, Iterable<StoredFileFields>)>[];

    for (final (trip, user, listImages, route, section) in data) {
      newProfileStore = newProfileStore.insertProfile(user);
      newStore = newStore.insertTrip(trip);
      filesByOwner.add((trip.id, listImages));
      ref
          .read(routeStoreProvider(trip.id).notifier)
          .emit(RouteStore.fromRemote(route: route, sections: section));
    }

    ref.read(tripStoreProvider.notifier).emit(newStore);
    ref
        .read(storedFileStoreProvider.notifier)
        .emit(
          ref.read(storedFileStoreProvider).upsertRemoteFiles(filesByOwner),
        );
    ref.read(profileStoreProvider.notifier).emit(newProfileStore);
    return null;
  });
}
