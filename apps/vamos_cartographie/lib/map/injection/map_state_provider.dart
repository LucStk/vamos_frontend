import 'package:domain_core/notification/failure.dart';
import 'package:map_application/application/intent_resolver.dart';
import 'package:map_application/map_application.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stored_file_application/application/application.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/injection/map_output_notifier.dart';
import 'package:vamos_cartographie/stored_file/stored_file.dart';
import 'package:vamos_cartographie/topology/injection/injection.dart';
import 'package:vamos_cartographie/trip/injection/trip_store.dart';
import 'package:vamos_cartographie/waypoint/injection/waypoint_store.dart';

part 'map_state_provider.g.dart';

@Riverpod(keepAlive: true)
class MapStateNotifier extends _$MapStateNotifier with MapEditor {
  @override
  MapState build(TripId tripId) {
    return const MapState();
  }

  @override
  IntentResolver get intentResolver => IntentResolver(
    ref.read(graphStoreProvider(tripId).notifier),
    ref.read(waypointStoreProvider(tripId).notifier),
    ref.read(mapOutputProvider(tripId).notifier),
  );

  Future<Failure?> loadTripDetails() async {
    final tripRepo = ref.read(tripRepositoryProvider);
    final res = await tripRepo.getTripDetails(tripId);
    return res.fold((Failure f) => f, (data) {
      var newWaypointStore = WaypointStore.initial();
      var newGraphStore = GraphStore.initial();
      var newMediaStore = StoredFileStore.initial();

      for (final v in data.vertices) {
        newGraphStore = newGraphStore.insertVertex(v);
        print("insert vertex $v");
      }
      for (final s in data.segments) {
        newGraphStore = newGraphStore.insertSegment(s);
        print("insert segment $s");
      }
      for (final (w, listImages) in data.waypointsImages) {
        newWaypointStore = newWaypointStore.insertWaypoint(w);
        for (final i in listImages) {
          newMediaStore = newMediaStore.insertStoredFile(w.id, i);
        }
      }
      final waypointStore = ref.read(waypointStoreProvider(tripId).notifier);
      waypointStore.state = newWaypointStore;

      final graphStore = ref.read(graphStoreProvider(tripId).notifier);
      graphStore.state = newGraphStore;

      final mediaStore = ref.read(storedFileStoreProvider.notifier);
      mediaStore.state = newMediaStore;
      return null;
    });
  }
}
