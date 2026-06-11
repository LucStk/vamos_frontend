// features/waypoints/presentation/providers/waypoints_notifier.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/features/graph/graph.dart';
import 'package:vamos_cartographie/features/graph/store/graph_store.dart';
import 'package:vamos_cartographie/features/waypoints/waypoints.dart';
part 'waypoints_notifier.g.dart';

@riverpod
class WaypointsNotifier extends _$WaypointsNotifier {
  GraphStore get graph => ref.read(graphStoreProvider);

  @override
  void build(int tripId) {
    _load(tripId);
  }

  Future<void> _load(int tripId) async {
    final repo = ref.read(waypointRepositoryProvider);

    final result = await repo.getWaypoints(tripId);

    result.fold((f) => throw Exception(f.message), (waypoints) {
      for (final wp in waypoints) {
        graph.upsert<Waypoint>(wp);
      }
    });
  }

  Map<int, Waypoint> get all => graph.getAll<Waypoint>();
}

@riverpod
Map<int, Waypoint> waypointMap(Ref ref, int tripId) {
  final graph = ref.watch(graphStoreProvider);
  return graph.getAll<Waypoint>();
}

@riverpod
Iterable<int> waypointsIds(Ref ref, int tripId) {
  final graph = ref.watch(graphStoreProvider);
  return graph.getAll<Waypoint>().keys;
}

@riverpod
Waypoint? waypoint(Ref ref, int tripId, int waypointId) {
  final graph = ref.watch(graphStoreProvider);
  return graph.get<Waypoint>(waypointId);
}

@riverpod
Map<int, Waypoint> waypointsByVertex(Ref ref, int tripId) {
  final graph = ref.watch(graphStoreProvider);

  final waypoints = graph.getAll<Waypoint>();

  return {for (final w in waypoints.values) w.vertexId: w};
}
