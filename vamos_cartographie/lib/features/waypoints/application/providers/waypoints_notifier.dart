// features/waypoints/presentation/providers/waypoints_notifier.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/features/waypoints/waypoints.dart';
part 'waypoints_notifier.g.dart';

@riverpod
class WaypointsNotifier extends _$WaypointsNotifier {
  WaypointRepository get repository => ref.read(waypointRepositoryProvider);

  Map<int, Waypoint> get _current => state.value ?? <int, Waypoint>{};
  void _emit(Map<int, Waypoint> next) => state = AsyncData(next);

  void _update(Waypoint w) {
    final next = Map<int, Waypoint>.from(_current)..[w.id] = w;

    _emit(next);
  }

  void _remove(int id) {
    final next = Map<int, Waypoint>.from(_current)..remove(id);
    _emit(next);
  }

  @override
  Future<Map<int, Waypoint>> build(int tripId) async {
    final result = await repository.getWaypoints(tripId);

    return result.fold(
      (e) => throw Exception(e.message),
      (list) => {for (final w in list) w.id: w},
    );
  }

  Future<void> create(int vertexId, WaypointDraft draft) async {
    final result = await repository.createWaypoint(tripId, vertexId, draft);

    result.fold((_) {}, (w) => _update(w));
  }

  Future<void> update(int id, WaypointDraft draft) async {
    final previous = _current;
    final optimistic = draft.toWaypoint(id);
    _update(optimistic);

    final result = await repository.updateWaypoint(id, draft);

    result.fold((_) => _emit(previous), (server) => _update(server));
  }

  Future<void> delete(int id) async {
    final previous = _current;

    _remove(id);

    final result = await repository.deleteWaypoint(id);

    result.fold((_) => _emit(previous), (_) {});
  }
}

// --- Providers Sélecteurs pour optimiser l'UI ---

@riverpod
List<int> waypointIds(Ref ref, int tripId) {
  // Ce provider ne notifiera que si un identifiant est ajouté ou retiré
  return ref.watch(
    waypointsProvider(tripId).select((map) => map.keys.toList()),
  );
}

@riverpod
Waypoint? waypoint(Ref ref, int tripId, int waypointId) {
  // Ce provider ne rebuilde le marqueur individuel QUE si ses données changent
  return ref.watch(waypointsProvider(tripId).select((map) => map[waypointId]));
}
