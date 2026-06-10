// features/waypoints/presentation/providers/waypoints_notifier.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/core/state/state.dart';
import 'package:vamos_cartographie/features/waypoints/application/services/waypoint_service.dart';
import 'package:vamos_cartographie/features/waypoints/waypoints.dart';
import "package:vamos_cartographie/features/topology/topology.dart";
part 'waypoints_notifier.g.dart';

@riverpod
class WaypointsNotifier extends _$WaypointsNotifier
    with EntityNotifier<Waypoint> {
  WaypointService get service => ref.read(waypointServiceProvider);

  @override
  Future<Map<int, Waypoint>> build(int tripId) async {
    return await service.getWaypoints(tripId);
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
    await optimistic(spec : OptimisticSpec(

    apply:(){
    upsertLocal(waypointDraft.toWaypoint(tmpId));
    VerticesNotifier.upsertLocal();
    },
    rollback: (){
      removeLocal(tmpId);
      verticesProvider.removeLocal()
    }

    ),

     remote: () => service.createWaypoint(tripId,waypointDraft,vertexId,latLng);
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
      remote: () => service.updateWaypoint(id, draft),
    );
  }

  Future<void> deleteWaypoint(int id) async {
    final old = getOrThrow(id);
    await optimistic(
      spec: OptimisticSpec(
        apply: () => removeLocal(id),
        rollback: () => upsertLocal(old),
      ),
      remote: () => service.deleteWaypoint(id),
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
