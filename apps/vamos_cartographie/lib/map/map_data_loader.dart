import 'package:domain_core/notification/failure.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stored_file_application/application/stored_file_store.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/stored_file/stored_file.dart';
import 'package:vamos_cartographie/topology/injection/providers/graph_store.dart';
import 'package:vamos_cartographie/trip/injection/trip_store.dart';
import 'package:vamos_cartographie/waypoint/injection/waypoint_store.dart';

Future<Failure?> loadTripDetails(Ref ref, TripId tripId) async {
  final tripRepo = ref.read(tripRepositoryProvider);
  final res = await tripRepo.getTripDetails(tripId);
  return res.fold((Failure f) => f, (data) {
    var newWaypointStore = WaypointStore.initial();
    var newGraphStore = GraphStore.initial();
    var newMediaStore = StoredFileStore.initial();
    for (final v in data.vertices) {
      newGraphStore = newGraphStore.insertVertex(v);
    }
    for (final s in data.segments) {
      newGraphStore = newGraphStore.insertSegment(s);
    }
    for (final (w, listImages) in data.waypointsImages) {
      newWaypointStore = newWaypointStore.insertWaypoint(w);
      for (final i in listImages) {
        newMediaStore = newMediaStore.insertStoredFile(w.id, i);
      }
    }
    ref.read(waypointStoreProvider(tripId).notifier).emit(newWaypointStore);
    ref.read(graphStoreProvider(tripId).notifier).emit(newGraphStore);
    ref.read(storedFileStoreProvider.notifier).emit(newMediaStore);
    return null;
  });
}
