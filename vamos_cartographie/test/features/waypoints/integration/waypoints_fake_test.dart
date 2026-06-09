import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vamos_cartographie/core/failure.dart';
import 'package:vamos_cartographie/dev_backend/core/fake_seeds.dart';
import 'package:vamos_cartographie/dev_backend/seeds/explore_seed.dart';
import 'package:vamos_cartographie/features/topology/domain/domain.dart';
import 'package:vamos_cartographie/features/trips/domain/trip.dart';
import 'package:vamos_cartographie/features/waypoints/application/providers/waypoints_notifier.dart';
import 'package:vamos_cartographie/features/waypoints/domain/domain.dart';
import 'package:vamos_cartographie/testing/backend/fixtures/fixtures.dart';

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
    trip: Trip(id: tripId, title: 'Voyage sans waypoints', description: ''),
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
  const int t1TripId = 0;
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

        final waypoints = expectRight(await repo.getWaypoints(t1TripId));

        expect(waypoints, hasLength(t1Waypoints.length));
      });

      test('retourne les données des waypoints fidèlement', () async {
        // Given: t1Waypoints avec types et descriptions connus
        // When: getWaypoints(t1.id) est appelé
        // Then: les champs sont correctement mappés
        final (:repo, store: _) = buildWaypointRepo(exploreSeed);

        final waypoints = expectRight(await repo.getWaypoints(t1TripId));

        final start = waypoints.firstWhere((w) => w.type == WaypointType.start);
        expect(start.description, isNotEmpty);
        expect(start.vertexId, isPositive);
      });

      test("retourne une liste vide si le trip n'a pas de waypoints", () async {
        // Given: un trip sans waypoints dans le store
        // When: getWaypoints est appelé
        // Then: liste vide sans erreur
        final seed = emptyWaypointSeed(tripId: 99);
        final (:repo, store: _) = buildWaypointRepo([seed]);

        final waypoints = expectRight(await repo.getWaypoints(99));

        expect(waypoints, isEmpty);
      });

      test('retourne ServerFailure pour un trip inconnu', () async {
        // Given: aucun trip avec l'id 999
        // When: getWaypoints(999) est appelé
        // Then: Left(ServerFailure) est retourné
        final (:repo, store: _) = buildWaypointRepo(exploreSeed);

        final result = await repo.getWaypoints(999);

        expect(result.isLeft(), isTrue);
        result.fold(
          (f) => expect(f, isA<ServerFailure>()),
          (_) => fail('Expected Left'),
        );
      });
    });

    // ── createWaypoint ──────────────────────────────────────────────────────

    group('createWaypoint', () {
      test('crée un waypoint avec le type uniquement', () async {
        // Given: t1 avec vertex 13 disponible
        // When: createWaypoint est appelé avec type=viewpoint
        // Then: le waypoint est créé et son type est correct
        final (:repo, store: _) = buildWaypointRepo(exploreSeed);
        final draft = WaypointDraft(type: WaypointType.viewpoint);

        final created = expectRight(
          await repo.createWaypoint(t1TripId, unusedVertexId, draft),
        );

        expect(created.type, WaypointType.viewpoint);
        expect(created.vertexId, unusedVertexId);
      });

      test('crée un waypoint avec titre et description', () async {
        // Given: t1 avec vertex 13 disponible
        // When: createWaypoint est appelé avec titre et description
        // Then: tous les champs sont persistés
        final (:repo, store: _) = buildWaypointRepo(exploreSeed);
        final draft = WaypointDraft(
          type: WaypointType.camping,
          title: 'Camp de la forêt',
          description: 'Nuit en plein air',
        );

        final created = expectRight(
          await repo.createWaypoint(t1TripId, unusedVertexId, draft),
        );

        expect(created.type, WaypointType.camping);
        expect(created.title, 'Camp de la forêt');
        expect(created.description, 'Nuit en plein air');
      });

      test('le waypoint créé est accessible dans le store', () async {
        // Given: t1 dans le store
        // When: createWaypoint est appelé
        // Then: le nouveau waypoint est présent dans le store sous-jacent
        final (:repo, :store) = buildWaypointRepo(exploreSeed);
        final draft = WaypointDraft(type: WaypointType.water, title: 'Source');

        final created = expectRight(
          await repo.createWaypoint(t1TripId, unusedVertexId, draft),
        );

        expect(store.waypointsMap.containsKey(created.id), isTrue);
        expect(store.waypointsMap[created.id]?.title, 'Source');
      });

      test('le waypoint sans titre reçoit une chaîne vide', () async {
        // Given: un draft sans titre
        // When: createWaypoint est appelé
        // Then: le waypoint est créé avec un titre vide sans erreur
        final (:repo, store: _) = buildWaypointRepo(exploreSeed);
        final draft = WaypointDraft(type: WaypointType.waypoint, title: '');

        final created = expectRight(
          await repo.createWaypoint(t1TripId, unusedVertexId, draft),
        );

        expect(created.title, '');
      });
    });

    // ── updateWaypoint ──────────────────────────────────────────────────────

    group('updateWaypoint', () {
      test('met à jour le type du waypoint', () async {
        // Given: waypoint id=10 de type START
        // When: updateWaypoint est appelé avec type=water
        // Then: le type est mis à jour
        final (:repo, store: _) = buildWaypointRepo(exploreSeed);
        const waypointId = 10;
        final draft = WaypointDraft(type: WaypointType.water);

        final updated = expectRight(
          await repo.updateWaypoint(waypointId, draft),
        );

        expect(updated.type, WaypointType.water);
        expect(updated.id, waypointId);
      });

      test('met à jour le titre du waypoint', () async {
        // Given: waypoint id=11
        // When: updateWaypoint est appelé avec un nouveau titre
        // Then: le titre est mis à jour
        final (:repo, store: _) = buildWaypointRepo(exploreSeed);
        const waypointId = 11;
        final draft = WaypointDraft(
          type: WaypointType.waypoint,
          title: 'Étape modifiée',
        );

        final updated = expectRight(
          await repo.updateWaypoint(waypointId, draft),
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
          type: WaypointType.viewpoint,
          description: 'Panorama exceptionnel',
        );

        final updated = expectRight(
          await repo.updateWaypoint(waypointId, draft),
        );

        expect(updated.description, 'Panorama exceptionnel');
      });

      test('retourne ServerFailure pour un waypoint inconnu', () async {
        // Given: aucun waypoint avec l'id 9999
        // When: updateWaypoint(9999, ...) est appelé
        // Then: Left(ServerFailure) est retourné
        final (:repo, store: _) = buildWaypointRepo(exploreSeed);
        final draft = WaypointDraft(type: WaypointType.waypoint);

        final result = await repo.updateWaypoint(9999, draft);

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

        expectRight(await repo.deleteWaypoint(10));

        expect(store.waypointsMap.containsKey(10), isFalse);
      });

      test('les autres waypoints du trip ne sont pas affectés', () async {
        // Given: t1 avec 4 waypoints
        // When: waypoint id=10 est supprimé
        // Then: les waypoints 11, 12, 14 sont toujours présents
        final (:repo, :store) = buildWaypointRepo(exploreSeed);

        expectRight(await repo.deleteWaypoint(10));

        expect(store.waypointsMap.containsKey(11), isTrue);
        expect(store.waypointsMap.containsKey(12), isTrue);
        expect(store.waypointsMap.containsKey(14), isTrue);
      });
    });
  });

  // =========================================================================
  // WaypointsNotifier — couche application (via ProviderContainer)
  // =========================================================================

  group('WaypointsNotifier avec Fake Client', () {
    late ProviderContainer container;

    setUp(() {
      container = buildContainer(exploreSeed);
    });

    tearDown(() {
      container.dispose();
    });

    // ── chargement initial ─────────────────────────────────────────────────

    test(
      'chargement initial : tous les waypoints du trip t1 sont présents',
      () async {
        // Given: store seedé avec t1 (4 waypoints)
        // When: WaypointsNotifier(t1.id) s'initialise
        // Then: les 4 waypoints sont dans l'état
        container.listen(waypointsProvider(t1TripId), (_, __) {});

        final waypoints = await container.read(
          waypointsProvider(t1TripId).future,
        );

        expect(waypoints, hasLength(t1Waypoints.length));
        expect(waypoints.containsKey(10), isTrue);
      },
    );

    test('trip sans waypoints : état initial est une Map vide', () async {
      // Given: un trip sans waypoints dans le store
      // When: WaypointsNotifier s'initialise sur ce trip
      // Then: état est vide
      final seed = emptyWaypointSeed(tripId: 99);
      final emptyContainer = buildContainer([seed]);
      addTearDown(emptyContainer.dispose);
      emptyContainer.listen(waypointsProvider(99), (_, __) {});

      final waypoints = await emptyContainer.read(waypointsProvider(99).future);

      expect(waypoints, isEmpty);
    });

    // Note : le test "trip inconnu → AsyncError" est intentionnellement
    // absent ici. En Riverpod 3, un AsyncNotifier qui échoue lors du
    // premier chargement passe en AsyncLoading(retrying) plutôt que
    // AsyncError. Ce comportement est couvert par le test repository
    // "retourne ServerFailure pour un trip inconnu".

    // ── createWaypoint ──────────────────────────────────────────────────────

    test("createWaypoint : le nouveau waypoint apparaît dans l'état", () async {
      // Given: waypoints de t1 chargés
      // When: createWaypoint est appelé avec vertexId=13
      // Then: l'état contient le nouveau waypoint
      container.listen(waypointsProvider(t1TripId), (_, __) {});
      await container.read(waypointsProvider(t1TripId).future);

      final draft = WaypointDraft(
        type: WaypointType.camping,
        title: 'Camp de nuit',
        description: 'Au bord de la rivière',
      );
      await container
          .read(waypointsProvider(t1TripId).notifier)
          .createWaypoint(unusedVertexId, draft);

      final waypoints = container
          .read(waypointsProvider(t1TripId))
          .requireValue;
      expect(waypoints.length, t1Waypoints.length + 1);

      final nouveau = waypoints.values.firstWhere(
        (w) => w.title == 'Camp de nuit',
      );
      expect(nouveau.type, WaypointType.camping);
      expect(nouveau.description, 'Au bord de la rivière');
      expect(nouveau.vertexId, unusedVertexId);
    });

    // ── updateWaypoint ──────────────────────────────────────────────────────

    test("updateWaypoint : l'état reflète les données mises à jour", () async {
      // Given: waypoints de t1 chargés
      // When: updateWaypoint est appelé sur id=10
      // Then: l'état contient le waypoint mis à jour
      container.listen(waypointsProvider(t1TripId), (_, __) {});
      await container.read(waypointsProvider(t1TripId).future);

      final draft = WaypointDraft(
        type: WaypointType.viewpoint,
        title: 'Belvédère',
        description: 'Vue panoramique',
      );
      await container
          .read(waypointsProvider(t1TripId).notifier)
          .updateWaypoint(10, draft);

      final waypoints = container
          .read(waypointsProvider(t1TripId))
          .requireValue;
      expect(waypoints[10]?.type, WaypointType.viewpoint);
      expect(waypoints[10]?.title, 'Belvédère');
    });

    test(
      "updateWaypoint rollback : l'état revient à la valeur originale si le serveur échoue",
      () async {
        // Given: waypoints de t1 chargés
        //   Et: waypoint id=10 supprimé du store (simule une panne serveur)
        // When: updateWaypoint est appelé sur id=10
        // Then: l'état est restauré avec le type original du waypoint
        final backend = buildFakeBackend(exploreSeed);
        final rollbackContainer = buildContainer([], backend: backend);
        addTearDown(rollbackContainer.dispose);
        rollbackContainer.listen(waypointsProvider(t1TripId), (_, __) {});
        await rollbackContainer.read(waypointsProvider(t1TripId).future);

        final originalType = rollbackContainer
            .read(waypointsProvider(t1TripId))
            .requireValue[10]!
            .type;

        // Supprime le waypoint du store sous-jacent
        backend.store.removeWaypoint(10);

        final draft = WaypointDraft(
          type: WaypointType.historic,
          title: 'Titre non sauvegardé',
        );
        await rollbackContainer
            .read(waypointsProvider(t1TripId).notifier)
            .updateWaypoint(10, draft);

        final waypoints = rollbackContainer
            .read(waypointsProvider(t1TripId))
            .requireValue;
        expect(waypoints[10]?.type, originalType);
      },
    );

    // ── deleteWaypoint ──────────────────────────────────────────────────────

    test("deleteWaypoint : le waypoint disparaît de l'état", () async {
      // Given: waypoints de t1 chargés
      // When: deleteWaypoint(10) est appelé
      // Then: waypoint 10 n'est plus dans l'état, les autres sont présents
      container.listen(waypointsProvider(t1TripId), (_, __) {});
      await container.read(waypointsProvider(t1TripId).future);

      await container
          .read(waypointsProvider(t1TripId).notifier)
          .deleteWaypoint(10);

      final waypoints = container
          .read(waypointsProvider(t1TripId))
          .requireValue;
      expect(waypoints.containsKey(10), isFalse);
      expect(waypoints.containsKey(11), isTrue);
      expect(waypoints.containsKey(12), isTrue);
    });
  });
}
