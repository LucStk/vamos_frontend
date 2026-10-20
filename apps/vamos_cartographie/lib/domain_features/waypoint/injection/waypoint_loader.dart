import 'package:domain_core/failures.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stored_file_application/application/stored_file_store.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/stored_file/injection/stored_file_provider.dart';
import 'package:vamos_cartographie/domain_features/waypoint/waypoint.dart';
part "waypoint_loader.g.dart";

@Riverpod(keepAlive: true)
Future<Failure?> loadWaypointNotifier(Ref ref, TripId tripId) async {
  final waypointRepo = ref.watch(waypointRepositoryProvider);
  final res = await waypointRepo.getWaypoints(tripId);
  return res.fold(
    (failure) => failure, // L'erreur sera capturée par le framework Riverpod
    (data) {
      if (!ref.mounted) return;

      ref
          .read(waypointStoreProvider(tripId).notifier)
          .emit(WaypointStore.fromRemote(data.map((m) => m.waypoint)));

      final files = ref.read(storedFileStoreProvider);
      ref
          .read(storedFileStoreProvider.notifier)
          .emit(
            files.upsertRemoteFiles([
              for (final (w) in data) (w.waypoint.id, w.images),
            ]),
          );
      return null;
    },
  );
}
