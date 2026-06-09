// features/waypoints/presentation/providers/waypoints_notifier.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/features/waypoints/waypoints.dart';
import 'package:vamos_cartographie/core/state/entity_store_helpers.dart';
import "package:vamos_cartographie/features/shared/shared.dart";
part 'waypoints_notifier.g.dart';

@riverpod
class WaypointsNotifier extends _$WaypointsNotifier {
  WaypointRepository get repository => ref.read(waypointRepositoryProvider);

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
    final result = await repository.getWaypoints(tripId);

    return result.fold(
      (e) => throw Exception(e.message),
      (list) => {for (final w in list) w.id: w},
    );
  }

  Map<int, Waypoint> get byVertexId => {
    for (final w in _current.values) w.vertexId: w,
  };

  // ---------------------------------------------------------------------------
  // CREATE
  // ---------------------------------------------------------------------------

  Future<void> createWaypoint(
    WaypointDraft waypointDraft,
    int? vertexId,
    LatLng? latLng,
  ) async {
    final result = await repository.createWaypoint(
      tripId,
      waypointDraft,
      vertexId,
      latLng,
    );

    result.fold((_) {}, (w) {
      final next = EntityStoreHelpers.set(_current, w.id, w);
      _emit(next);
    });
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

    final result = await repository.updateWaypoint(id, draft);

    result.fold(
      (_) => _emit(previous), // rollback
      (server) {
        final next = EntityStoreHelpers.set(_current, server.id, server);
        _emit(next);
      },
    );
  }

  // ---------------------------------------------------------------------------
  // DELETE
  // ---------------------------------------------------------------------------

  Future<void> deleteWaypoint(int id) async {
    final previous = _current;

    _emit(EntityStoreHelpers.remove(_current, id));

    final result = await repository.deleteWaypoint(id);

    result.fold(
      (_) => _emit(previous), // rollback
      (_) {},
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
