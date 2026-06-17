import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vamos_cartographie/backend/backend.dart';
import 'package:vamos_cartographie/features/features.dart';
import 'package:vamos_cartographie/testing/backend/fixtures/fixtures.dart';
import 'package:vamos_cartographie/vamos_cartographie.dart';

import '../../../helpers/fake_backend_builder.dart';

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

T expectRight<T>(Either<Failure, T> result) {
  return result.fold((l) {
    fail('Expected Right but got Left: ${l.message}');
  }, (r) => r);
}

/// Seed minimal : un trip sans waypoints.
/// Permet de tester le chargement d'une liste vide sans erreur.
Seed emptyWaypointSeed({int tripId = 99, List<Vertex> vertices = const []}) {
  return Seed(
    trip: Trip(
      id: Id<Trip>(tripId),
      title: 'Voyage sans waypoints',
      description: '',
    ),
    waypoints: [],
    vertices: vertices,
    segments: [],
  );
}

void main() {
  // IDs connus du seed t1 (trip id=0)
  //   Waypoints : 10, 11, 12, 14
  //   Vertices  : 10, 11, 12, 13, 14
  //   Vertex 13 n'a pas de waypoint attaché — utilisé pour les créations.
  const int t1TripId = 1;
  const int unusedVertexId = 13;

  // =========================================================================
  // WaypointRepository — couche données
  // =========================================================================

  group('WaypointRepository avec Fake Client', () {
    // ── getWaypoints ────────────────────────────────────────────────────────

    group('getWaypoints', () {
      test('retourne tous les waypoints du trip t1', () async {
        // Given: store seedé avec t1 (4 waypoints)
        // When: getWaypoints(t1.id) est appelé
        // Then: les 4 waypoints sont retournés
        final (:repo, store: _) = buildWaypointRepo(exploreSeed);

        final waypoints = expectRight(
          await repo.getWaypoints(Id<Trip>(t1TripId)),
        );

        expect(waypoints, hasLength(t1Waypoints.length));
      });

      test('retourne les données des waypoints fidèlement', () async {
        // Given: t1Waypoints avec types et descriptions connus
        // When: getWaypoints(t1.id) est appelé
        // Then: les champs sont correctement mappés
        final (:repo, store: _) = buildWaypointRepo(exploreSeed);

        final waypoints = expectRight(
          await repo.getWaypoints(Id<Trip>(t1TripId)),
        );

        final start = waypoints.firstWhere(
          (w) => w.poiCategory == PoiCategory.start,
        );
        expect(start.description, isNotEmpty);
        expect(start.vertexId.value, isPositive);
      });

      test("retourne une liste vide si le trip n'a pas de waypoints", () async {
        // Given: un trip sans waypoints dans le store
        // When: getWaypoints est appelé
        // Then: liste vide sans erreur
        final seed = emptyWaypointSeed(tripId: 99);
        final (:repo, store: _) = buildWaypointRepo([seed]);

        final waypoints = expectRight(await repo.getWaypoints(Id<Trip>(99)));

        expect(waypoints, isEmpty);
      });

      test('retourne ServerFailure pour un trip inconnu', () async {
        // Given: aucun trip avec l'id 999
        // When: getWaypoints(999) est appelé
        // Then: Left(ServerFailure) est retourné
        final (:repo, store: _) = buildWaypointRepo(exploreSeed);

        final result = await repo.getWaypoints(Id<Trip>(999));

        expect(result.isLeft(), isTrue);
        result.fold(
          (f) => expect(f, isA<ServerFailure>()),
          (_) => fail('Expected Left'),
        );
      });
    });

    // ── createWaypoint ──────────────────────────────────────────────────────

    group('createWaypoint', () {
      test('crée un waypoint avec le poiCategory uniquement', () async {
        // Given: t1 avec vertex 13 disponible
        // When: createWaypoint est appelé avec poiCategory=viewpoint
        // Then: le waypoint est créé et son poiCategory est correct
        final (:repo, store: _) = buildWaypointRepo(exploreSeed);
        final draft = WaypointDraft(poiCategory: PoiCategory.viewpoint);

        final created = expectRight(
          await repo.createWaypoint(
            Id<Trip>(t1TripId),
            draft,
            Id<Vertex>(unusedVertexId),
            null,
          ),
        );

        expect(created.waypoint.poiCategory, PoiCategory.viewpoint);
        expect(created.vertex.id, Id<Vertex>(unusedVertexId));
      });

      test('crée un waypoint avec titre et description', () async {
        // Given: t1 avec vertex 13 disponible
        // When: createWaypoint est appelé avec titre et description
        // Then: tous les champs sont persistés
        final (:repo, store: _) = buildWaypointRepo(exploreSeed);
        final draft = WaypointDraft(
          poiCategory: PoiCategory.camping,
          title: 'Camp de la forêt',
          description: 'Nuit en plein air',
        );

        final created = expectRight(
          await repo.createWaypoint(
            Id<Trip>(t1TripId),
            draft,
            Id<Vertex>(unusedVertexId),
            null,
          ),
        );

        expect(created.waypoint.poiCategory, PoiCategory.camping);
        expect(created.waypoint.title, 'Camp de la forêt');
        expect(created.waypoint.description, 'Nuit en plein air');
      });

      test('le waypoint créé est accessible dans le store', () async {
        // Given: t1 dans le store
        // When: createWaypoint est appelé
        // Then: le nouveau waypoint est présent dans le store sous-jacent
        final (:repo, :store) = buildWaypointRepo(exploreSeed);
        final draft = WaypointDraft(
          poiCategory: PoiCategory.water,
          title: 'Source',
        );

        final created = expectRight(
          await repo.createWaypoint(
            Id<Trip>(t1TripId),
            draft,
            Id<Vertex>(unusedVertexId),
            null,
          ),
        );

        expect(store.waypointsMap.containsKey(created.waypoint.id), isTrue);
        expect(store.waypointsMap[created.waypoint.id]?.title, 'Source');
      });

      test('le waypoint sans titre reçoit une chaîne vide', () async {
        // Given: un draft sans titre
        // When: createWaypoint est appelé
        // Then: le waypoint est créé avec un titre vide sans erreur
        final (:repo, store: _) = buildWaypointRepo(exploreSeed);
        final draft = WaypointDraft(
          poiCategory: PoiCategory.waypoint,
          title: '',
        );

        final created = expectRight(
          await repo.createWaypoint(
            Id<Trip>(t1TripId),
            draft,
            Id<Vertex>(unusedVertexId),
            null,
          ),
        );

        expect(created.waypoint.title, '');
      });
    });

    // ── updateWaypoint ──────────────────────────────────────────────────────

    group('updateWaypoint', () {
      test('met à jour le poiCategory du waypoint', () async {
        // Given: waypoint id=10 de poiCategory START
        // When: updateWaypoint est appelé avec poiCategory=water
        // Then: le poiCategory est mis à jour
        final (:repo, store: _) = buildWaypointRepo(exploreSeed);
        const waypointId = 10;
        final draft = WaypointDraft(poiCategory: PoiCategory.water);

        final updated = expectRight(
          await repo.updateWaypoint(Id<Waypoint>(waypointId), draft),
        );

        expect(updated.poiCategory, PoiCategory.water);
        expect(updated.id, Id<Waypoint>(waypointId));
      });

      test('met à jour le titre du waypoint', () async {
        // Given: waypoint id=11
        // When: updateWaypoint est appelé avec un nouveau titre
        // Then: le titre est mis à jour
        final (:repo, store: _) = buildWaypointRepo(exploreSeed);
        const waypointId = 11;
        final draft = WaypointDraft(
          poiCategory: PoiCategory.waypoint,
          title: 'Étape modifiée',
        );

        final updated = expectRight(
          await repo.updateWaypoint(Id<Waypoint>(waypointId), draft),
        );

        expect(updated.title, 'Étape modifiée');
      });

      test('met à jour la description du waypoint', () async {
        // Given: waypoint id=12
        // When: updateWaypoint est appelé avec une nouvelle description
        // Then: la description est mise à jour
        final (:repo, store: _) = buildWaypointRepo(exploreSeed);
        const waypointId = 12;
        final draft = WaypointDraft(
          poiCategory: PoiCategory.viewpoint,
          description: 'Panorama exceptionnel',
        );

        final updated = expectRight(
          await repo.updateWaypoint(Id<Waypoint>(waypointId), draft),
        );

        expect(updated.description, 'Panorama exceptionnel');
      });

      test('retourne ServerFailure pour un waypoint inconnu', () async {
        // Given: aucun waypoint avec l'id 9999
        // When: updateWaypoint(9999, ...) est appelé
        // Then: Left(ServerFailure) est retourné
        final (:repo, store: _) = buildWaypointRepo(exploreSeed);
        final draft = WaypointDraft(poiCategory: PoiCategory.waypoint);

        final result = await repo.updateWaypoint(Id<Waypoint>(9999), draft);

        expect(result.isLeft(), isTrue);
        result.fold(
          (f) => expect(f, isA<ServerFailure>()),
          (_) => fail('Expected Left'),
        );
      });
    });

    // ── deleteWaypoint ──────────────────────────────────────────────────────

    group('deleteWaypoint', () {
      test('supprime le waypoint du store', () async {
        // Given: waypoint id=10 dans le store
        // When: deleteWaypoint(10) est appelé
        // Then: le waypoint n'est plus dans le store
        final (:repo, :store) = buildWaypointRepo(exploreSeed);

        expectRight(await repo.deleteWaypoint(Id<Waypoint>(10)));

        expect(store.waypointsMap.containsKey(Id<Waypoint>(10)), isFalse);
      });

      test('les autres waypoints du trip ne sont pas affectés', () async {
        // Given: t1 avec 4 waypoints
        // When: waypoint id=10 est supprimé
        // Then: les waypoints 11, 12, 14 sont toujours présents
        final (:repo, :store) = buildWaypointRepo(exploreSeed);

        expectRight(await repo.deleteWaypoint(Id<Waypoint>(10)));

        expect(store.waypointsMap.containsKey(Id<Waypoint>(11)), isTrue);
        expect(store.waypointsMap.containsKey(Id<Waypoint>(12)), isTrue);
        expect(store.waypointsMap.containsKey(Id<Waypoint>(14)), isTrue);
      });
    });
  });

  // =========================================================================
  // WaypointsNotifier — couche application (via ProviderContainer)
  // =========================================================================
}
