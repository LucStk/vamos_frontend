// features/waypoints/presentation/providers/waypoints_notifier.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dartz/dartz.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/core/failure.dart';
import 'package:vamos_cartographie/features/waypoints/waypoints.dart';
import 'package:flutter/material.dart';
part 'waypoints_notifier.g.dart';

@riverpod
class WaypointsStore extends _$WaypointsStore {
  late final WaypointRepository repository;

  @override
  Map<int, Waypoint> build(int tripId) {
    repository = ref.read(waypointRepositoryProvider);
    _load(tripId);
    return {};
  }

  Future<void> _load(int tripId) async {
    final result = await repository.getWaypoints(tripId);

    result.fold(
      (failure) {
        debugPrint('load failed');
      },
      (waypoints) {
        state = {for (final w in waypoints) w.id: w};
      },
    );
  }

  // --- Mises à jour locales (Synchrones pour l'UI) ---

  void _addWaypointLocal(Waypoint waypoint) {
    state = {...state, waypoint.id: waypoint};
  }

  void _removeWaypointLocalById(int id) {
    final updated = Map<int, Waypoint>.from(state)..remove(id);
    state = updated;
  }

  void _updateWaypointLocal(Waypoint waypoint) {
    if (!state.containsKey(waypoint.id)) {
      throw Exception("Waypoint non trouvé dans le store local");
    }
    state = {...state, waypoint.id: waypoint};
  }

  // --- Opérations Distantes (Asynchrones avec le serveur) ---

  Future<void> createWaypointRemote(WaypointDraft draft, int vertexId) async {
    final Either<Failure, Waypoint> result = await repository.createWaypoint(
      tripId, // tripId est accessible directement via l'argument du build
      vertexId,
      draft,
    );

    result.fold(
      (failure) => null, // Gérer l'erreur si nécessaire
      (serverWaypoint) => _addWaypointLocal(serverWaypoint),
    );
  }

  Future<void> updateWaypointRemote(int id, WaypointDraft draft) async {
    final previousState = state;
    final currentWaypoint = state[id];

    if (currentWaypoint == null) {
      throw Exception('Waypoint $id not found in state');
    }

    // Mise à jour optimiste locale
    final optimisticWaypoint = draft.toWaypoint(id, currentWaypoint.vertexId);
    _updateWaypointLocal(optimisticWaypoint);

    final Either<Failure, Waypoint> result = await repository.updateWaypoint(
      id,
      draft,
    );

    result.fold(
      (failure) {
        // Rollback en cas d'échec
        state = previousState;
      },
      (serverWaypoint) {
        // Synchronisation avec la vérité du serveur si différente
        if (optimisticWaypoint != serverWaypoint) {
          _updateWaypointLocal(serverWaypoint);
        }
      },
    );
  }

  Future<void> deleteWaypointRemote(int waypointId) async {
    final Either<Failure, void> result = await repository.deleteWaypoint(
      waypointId,
    );

    result.fold(
      (failure) => null, // Gérer l'erreur si nécessaire
      (_) => _removeWaypointLocalById(waypointId),
    );
  }
}

// --- Providers Sélecteurs pour optimiser l'UI ---

@riverpod
List<int> waypointIds(Ref ref, int tripId) {
  // Ce provider ne notifiera que si un identifiant est ajouté ou retiré
  return ref.watch(
    waypointsStoreProvider(tripId).select((map) => map.keys.toList()),
  );
}

@riverpod
Waypoint? waypoint(Ref ref, int tripId, int waypointId) {
  // Ce provider ne rebuilde le marqueur individuel QUE si ses données changent
  return ref.watch(
    waypointsStoreProvider(tripId).select((map) => map[waypointId]),
  );
}
