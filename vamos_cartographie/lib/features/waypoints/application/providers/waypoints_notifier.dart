// features/waypoints/presentation/providers/waypoints_notifier.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/features/waypoints/application/services/waypoint_service.dart';
import 'package:vamos_cartographie/features/waypoints/waypoints.dart';
import 'package:vamos_cartographie/core/state/entity_store_helpers.dart';
import "package:vamos_cartographie/features/shared/shared.dart";
part 'waypoints_notifier.g.dart';

@riverpod
class WaypointsNotifier extends _$WaypointsNotifier {
  WaypointService get service => ref.read(waypointServiceProvider);

  // ---------------------------------------------------------------------------
  // STATE ACCESS
  // ---------------------------------------------------------------------------

  Map<int, Waypoint> get _current => state.value ?? <int, Waypoint>{};

  void _emit(Map<int, Waypoint> next) {
    state = AsyncData(next);
  }

  // ---------------------------------------------------------------------------
  // LIFECYCLE
  // ---------------------------------------------------------------------------
  @override
  Future<Map<int, Waypoint>> build(int tripId) async {
    return await service.getWaypoints(tripId);
  }

  Map<int, Waypoint> get byVertexId => {
    for (final w in _current.values) w.vertexId: w,
  };

  Future<void> createWaypoint(
    WaypointDraft waypointDraft,
    int? vertexId,
    LatLng? latLng,
  ) async {
    final result = await service.createWaypoint(
      tripId,
      waypointDraft,
      vertexId,
      latLng,
    );
    _emit(EntityStoreHelpers.set(_current, result.id, result));
  }

  // ---------------------------------------------------------------------------
  // UPDATE (OPTIMISTIC)
  // ---------------------------------------------------------------------------

  Future<void> updateWaypoint(int id, WaypointDraft draft) async {
    final previous = _current;

    final existing = previous[id];
    if (existing == null) return;

    final optimistic = existing.copyWith(
      title: draft.title,
      type: draft.type,
      description: draft.description,
      images: draft.images,
    );

    _emit(EntityStoreHelpers.update(previous, id, optimistic));
    try {
      final server = await service.updateWaypoint(id, draft);
      _emit(EntityStoreHelpers.set(_current, server.id, server));
    } catch (_) {
      _emit(previous); // rollback
    }
  }

  // ---------------------------------------------------------------------------
  // DELETE
  // ---------------------------------------------------------------------------

  Future<void> deleteWaypoint(int id) async {
    final previous = _current;
    _emit(EntityStoreHelpers.remove(_current, id));
    try {
      await service.deleteWaypoint(id);
    } catch (_) {
      _emit(previous);
    }
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
