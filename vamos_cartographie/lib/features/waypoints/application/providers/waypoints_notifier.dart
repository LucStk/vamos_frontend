// features/waypoints/presentation/providers/waypoints_notifier.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/core/state/state.dart';
import 'package:vamos_cartographie/features/waypoints/waypoints.dart';
import "package:vamos_cartographie/features/topology/topology.dart";
part 'waypoints_notifier.g.dart';

@riverpod
class WaypointsNotifier extends _$WaypointsNotifier
    with EntityNotifier<Waypoint> {
  WaypointRepository get repo => ref.read(waypointRepositoryProvider);

  @override
  Future<Map<int, Waypoint>> build(int tripId) async {
    return _load(tripId);
  }

  Future<Map<int, Waypoint>> _load(int tripId) async {
    final result = await repo.getWaypoints(tripId);

    return result.fold(
      (failure) => throw Exception(failure.message),
      (trips) => {for (final trip in trips) trip.id: trip},
    );
  }

  Map<int, Waypoint> get byVertexId => {
    for (final w in current.values) w.vertexId: w,
  };

  Future<void> createWaypoint(
    WaypointDraft waypointDraft,
    int? vertexId,
    LatLng? latLng,
  ) async {
    final tmpId = nextTempId();
    await optimistic(
      spec: OptimisticSpec(
        apply: () {
          upsertLocal(waypointDraft.toWaypoint(tmpId));
          VerticesNotifier.upsertLocal();
        },
        rollback: () {
          removeLocal(tmpId);
          verticesProvider.removeLocal();
        },
      ),

      remote: () =>
          repo.createWaypoint(tripId, waypointDraft, vertexId, latLng),
    );
  }

  // ---------------------------------------------------------------------------
  // UPDATE (OPTIMISTIC)
  // ---------------------------------------------------------------------------

  Future<void> updateWaypoint(int id, WaypointDraft draft) async {
    final old = getOrThrow(id);
    await optimistic(
      spec: OptimisticSpec(
        apply: () => updateLocal(draft.toWaypoint(id)),
        reconcile: updateLocal,
        rollback: () => updateLocal(old),
      ),
      remote: () => repo.updateWaypoint(id, draft),
    );
  }

  Future<void> deleteWaypoint(int id) async {
    final old = getOrThrow(id);
    await optimistic(
      spec: OptimisticSpec(
        apply: () => removeLocal(id),
        rollback: () => upsertLocal(old),
      ),
      remote: () => repo.deleteWaypoint(id),
    );
  }
} // --- Providers Sélecteurs pour optimiser l'UI ---

@riverpod
Map<int, Waypoint> waypointMap(Ref ref, int tripId) {
  return ref.watch(waypointsProvider(tripId)).value ?? const {};
}

@riverpod
Iterable<int> waypointsIds(Ref ref, int tripId) {
  return ref.watch(waypointMapProvider(tripId).select((map) => map.keys));
}

@riverpod
Waypoint? waypoint(Ref ref, int tripId, int waypointId) {
  return ref.watch(
    waypointMapProvider(tripId).select((map) => map[waypointId]),
  );
}

// Provider pour retrouver un Waypoint depuis son vertexId
@riverpod
Map<int, Waypoint> waypointsByVertex(Ref ref, int tripId) {
  final waypoints = ref.watch(waypointsProvider(tripId)).value ?? {};

  return {for (final w in waypoints.values) w.vertexId: w};
}
