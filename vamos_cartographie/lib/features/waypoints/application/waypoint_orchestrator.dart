import 'package:vamos_cartographie/core/state/graph_store_providers.dart';
import 'package:vamos_cartographie/core/state/optimistic_graph_store.dart';
import 'package:vamos_cartographie/features/features.dart';
import "package:riverpod_annotation/riverpod_annotation.dart";
part "waypoint_orchestrator.g.dart";

@riverpod
class WaypointOrchestrator extends _$WaypointOrchestrator {
  OptimisticGraphStore get graph => ref.read(graphStoreProvider);
  WaypointRepository get repo => ref.read(waypointRepositoryProvider);

  @override
  void build(int tripId) {}

  Future<void> updateWaypoint(int id, WaypointDraft draft) async {
    final old = graph.getOrThrow<Waypoint>(id);
    final updated = draft.toWaypoint(id);

    graph.update<Waypoint>(updated);

    final result = await repo.updateWaypoint(id, draft);

    result.fold(
      (failure) {
        graph.update<Waypoint>(old);
        throw Exception(failure.message);
      },
      (wp) {
        graph.upsert<Waypoint>(wp);
      },
    );
  }

  Future<void> deleteWaypoint(int id) async {
    final old = graph.getOrThrow<Waypoint>(id);

    graph.remove<Waypoint>(id);

    final result = await repo.deleteWaypoint(id);

    result.fold((failure) {
      graph.upsert<Waypoint>(old);
      throw Exception(failure.message);
    }, (_) {});
  }
}
