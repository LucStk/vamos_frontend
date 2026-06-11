import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/core/failure.dart';
import 'package:vamos_cartographie/backend/core/fake_seeds.dart';
import 'package:vamos_cartographie/backend/seeds/explore_seed.dart';
import 'package:vamos_cartographie/features/topology/application/providers/segments_notifier.dart';
import 'package:vamos_cartographie/features/topology/application/providers/vertex_notifier.dart';
import 'package:vamos_cartographie/features/topology/domain/domain.dart';
import 'package:vamos_cartographie/features/trips/domain/trip.dart';
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

/// Seed minimal avec un trip sans topologie.
Seed emptyTopologySeed({int tripId = 98}) => Seed(
  trip: Trip(id: tripId, title: 'Trip sans topologie', description: ''),
  waypoints: [],
  vertices: [],
  segments: [],
);

void main() {
  // Fixtures connues pour t1 (trip id=0) :
  //   Segments : 10(train,v10→v11), 11(bike,v11→v12), 12(bike,v12→v13), 13(bike,v13→v14)
  //   Vertices : 10(Paris), 11(Rennes), 12(Brest), 13(Lorient), 14(Nantes)
  const int t1TripId = 0;

  // =========================================================================
  // SegmentRepository — couche données
  // =========================================================================

  group('SegmentRepository avec Fake Client', () {
    // ── getSegments ─────────────────────────────────────────────────────────

    group('getSegments', () {
      test('retourne tous les segments du trip t1', () async {
        // Given: store seedé avec t1 (4 segments)
        // When: getSegments(t1.id) est appelé
        // Then: les 4 segments sont retournés
        final (:repo, store: _) = buildSegmentRepo(exploreSeed);

        final segments = expectRight(await repo.getSegments(t1TripId));

        expect(segments, hasLength(t1Segments.length));
      });

      test('retourne les données des segments fidèlement', () async {
        // Given: t1Segments avec types et vertex ids connus
        // When: getSegments(t1.id) est appelé
        // Then: les champs sont correctement mappés
        final (:repo, store: _) = buildSegmentRepo(exploreSeed);

        final segments = expectRight(await repo.getSegments(t1TripId));
        final trainSeg = segments.firstWhere(
          (s) => s.type == SegmentType.train,
        );

        expect(trainSeg.startVertexId, isPositive);
        expect(trainSeg.endVertexId, isPositive);
        expect(trainSeg.geometry, isNotEmpty);
      });

      test('retourne la géométrie avec les coordonnées des vertices', () async {
        // Given: segment 10 de t1 (train, v10→v11)
        // When: getSegments est appelé
        // Then: la géométrie contient 2 points correspondant aux coords de v10 et v11
        final (:repo, store: _) = buildSegmentRepo(exploreSeed);

        final segments = expectRight(await repo.getSegments(t1TripId));
        final seg10 = segments.firstWhere((s) => s.id == 10);

        expect(seg10.geometry, hasLength(2));
        // v10 = LatLng(48.8566, 2.3522) — Paris
        expect(seg10.geometry.first.latitude, closeTo(48.8566, 0.001));
      });

      test('retourne une liste vide pour un trip sans segments', () async {
        // Given: un trip sans segments dans le store
        // When: getSegments est appelé
        // Then: liste vide sans erreur
        final seed = emptyTopologySeed(tripId: 98);
        final (:repo, store: _) = buildSegmentRepo([seed]);

        final segments = expectRight(await repo.getSegments(98));

        expect(segments, isEmpty);
      });

      test('retourne ServerFailure pour un trip inconnu', () async {
        // Given: tripId 999 n'est pas dans le store
        // When: getSegments(999) est appelé
        // Then: Left(ServerFailure) est retourné
        final (:repo, store: _) = buildSegmentRepo(exploreSeed);

        final result = await repo.getSegments(999);

        expect(result.isLeft(), isTrue);
        result.fold(
          (f) => expect(f, isA<ServerFailure>()),
          (_) => fail('Expected Left'),
        );
      });
    });

    // ── createSegment ────────────────────────────────────────────────────────

    group('createSegment', () {
      test('crée un segment avec le bon type et les bons vertices', () async {
        // Given: t1 avec vertices 10-14 disponibles
        // When: createSegment est appelé avec type=walk entre v10 et v14
        // Then: le segment est créé avec les bonnes propriétés
        final (:repo, store: _) = buildSegmentRepo(exploreSeed);
        final draft = SegmentDraft(
          type: SegmentType.walk,
          startVertexId: 10,
          endVertexId: 14,
        );

        final created = expectRight(await repo.createSegment(t1TripId, draft));

        expect(created.type, SegmentType.walk);
        expect(created.startVertexId, 10);
        expect(created.endVertexId, 14);
      });

      test('le segment créé a une géométrie basée sur les vertices', () async {
        // Given: vertices 10 et 14 de t1 avec des coordonnées connues
        // When: createSegment est appelé
        // Then: la géométrie contient les positions des deux vertices
        final (:repo, store: _) = buildSegmentRepo(exploreSeed);
        final draft = SegmentDraft(
          type: SegmentType.bike,
          startVertexId: 10,
          endVertexId: 14,
        );

        final created = expectRight(await repo.createSegment(t1TripId, draft));

        expect(created.geometry, hasLength(2));
      });

      test('le segment créé est accessible dans le store', () async {
        // Given: t1 dans le store
        // When: createSegment est appelé
        // Then: le nouveau segment est présent dans le store sous-jacent
        final (:repo, :store) = buildSegmentRepo(exploreSeed);
        final draft = SegmentDraft(
          type: SegmentType.car,
          startVertexId: 10,
          endVertexId: 14,
        );

        final created = expectRight(await repo.createSegment(t1TripId, draft));

        expect(store.segmentsMap.containsKey(created.id), isTrue);
      });

      test('retourne ServerFailure si le trip est inconnu', () async {
        // Given: tripId 999 n'est pas dans le store
        // When: createSegment(999, ...) est appelé
        // Then: Left(ServerFailure) est retourné
        final (:repo, store: _) = buildSegmentRepo(exploreSeed);
        final draft = SegmentDraft(
          type: SegmentType.bike,
          startVertexId: 10,
          endVertexId: 11,
        );

        final result = await repo.createSegment(999, draft);

        expect(result.isLeft(), isTrue);
      });
    });

    // ── updateSegment ────────────────────────────────────────────────────────

    group('updateSegment', () {
      test('met à jour le type du segment', () async {
        // Given: segment 10 de type train
        // When: updateSegment est appelé avec type=boat
        // Then: le type est mis à jour
        final (:repo, store: _) = buildSegmentRepo(exploreSeed);
        final draft = SegmentDraft(
          type: SegmentType.boat,
          startVertexId: 10,
          endVertexId: 11,
        );

        final updated = expectRight(await repo.updateSegment(10, draft));

        expect(updated.type, SegmentType.boat);
        expect(updated.id, 10);
      });

      test('met à jour les vertices du segment', () async {
        // Given: segment 10 (v10→v11)
        // When: updateSegment est appelé avec de nouveaux vertices (v10→v14)
        // Then: les vertex ids sont mis à jour
        final (:repo, store: _) = buildSegmentRepo(exploreSeed);
        final draft = SegmentDraft(
          type: SegmentType.bike,
          startVertexId: 10,
          endVertexId: 14,
        );

        final updated = expectRight(await repo.updateSegment(10, draft));

        expect(updated.startVertexId, 10);
        expect(updated.endVertexId, 14);
      });

      test('retourne ServerFailure pour un segment inconnu', () async {
        // Given: aucun segment avec l'id 9999
        // When: updateSegment(9999, ...) est appelé
        // Then: Left(ServerFailure) est retourné
        final (:repo, store: _) = buildSegmentRepo(exploreSeed);
        final draft = SegmentDraft(
          type: SegmentType.bike,
          startVertexId: 10,
          endVertexId: 11,
        );

        final result = await repo.updateSegment(9999, draft);

        expect(result.isLeft(), isTrue);
        result.fold(
          (f) => expect(f, isA<ServerFailure>()),
          (_) => fail('Expected Left'),
        );
      });
    });

    // ── deleteSegment ────────────────────────────────────────────────────────

    group('deleteSegment', () {
      test('supprime le segment du store', () async {
        // Given: segment 10 dans le store
        // When: deleteSegment(10) est appelé
        // Then: le segment n'est plus dans le store
        final (:repo, :store) = buildSegmentRepo(exploreSeed);

        expectRight(await repo.deleteSegment(10));

        expect(store.segmentsMap.containsKey(10), isFalse);
      });

      test('les autres segments du trip ne sont pas affectés', () async {
        // Given: t1 avec 4 segments
        // When: segment 10 est supprimé
        // Then: les segments 11, 12, 13 sont toujours présents
        final (:repo, :store) = buildSegmentRepo(exploreSeed);

        expectRight(await repo.deleteSegment(10));

        expect(store.segmentsMap.containsKey(11), isTrue);
        expect(store.segmentsMap.containsKey(12), isTrue);
        expect(store.segmentsMap.containsKey(13), isTrue);
      });
    });
  });

  // =========================================================================
  // SegmentsNotifier — couche application
  // =========================================================================

  group('SegmentsNotifier avec Fake Client', () {
    late ProviderContainer container;

    setUp(() {
      container = buildContainer(exploreSeed);
    });

    tearDown(() {
      container.dispose();
    });

    test(
      'chargement initial : tous les segments de t1 sont présents',
      () async {
        // Given: store seedé avec t1 (4 segments)
        // When: SegmentsNotifier(t1.id) s'initialise
        // Then: les 4 segments sont dans l'état
        container.listen(segmentsProvider(t1TripId), (_, _) {});

        final segments = await container.read(
          segmentsProvider(t1TripId).future,
        );

        expect(segments, hasLength(t1Segments.length));
        expect(segments.containsKey(10), isTrue);
      },
    );

    test("createSegment : le nouveau segment apparaît dans l'état", () async {
      // Given: segments de t1 chargés
      // When: createSegment est appelé
      // Then: l'état contient le nouveau segment
      container.listen(segmentsProvider(t1TripId), (_, _) {});
      await container.read(segmentsProvider(t1TripId).future);

      final draft = SegmentDraft(
        type: SegmentType.walk,
        startVertexId: 10,
        endVertexId: 14,
      );
      await container
          .read(segmentsProvider(t1TripId).notifier)
          .createSegment(draft);

      final segments = container.read(segmentsProvider(t1TripId)).requireValue;
      expect(segments.length, t1Segments.length + 1);

      final nouveau = segments.values.firstWhere(
        (s) => s.type == SegmentType.walk,
      );
      expect(nouveau.startVertexId, 10);
      expect(nouveau.endVertexId, 14);
    });

    test("updateSegment : l'état reflète les données du serveur", () async {
      // Given: segment 10 de t1 chargé
      // When: updateSegment est appelé avec type=boat
      // Then: l'état contient le type mis à jour
      container.listen(segmentsProvider(t1TripId), (_, _) {});
      await container.read(segmentsProvider(t1TripId).future);

      final draft = SegmentDraft(
        type: SegmentType.boat,
        startVertexId: 10,
        endVertexId: 11,
      );
      await container
          .read(segmentsProvider(t1TripId).notifier)
          .updateSegment(10, draft);

      final segments = container.read(segmentsProvider(t1TripId)).requireValue;
      expect(segments[10]?.type, SegmentType.boat);
    });

    test(
      'updateSegment rollback : état restauré si le serveur échoue',
      () async {
        // Given: segments de t1 chargés
        //   Et: segment 10 supprimé du store (panne serveur)
        // When: updateSegment est appelé sur le segment 10
        // Then: l'état revient au type original
        final backend = buildFakeBackend(exploreSeed);
        final rollbackContainer = buildContainer([], backend: backend);
        addTearDown(rollbackContainer.dispose);
        rollbackContainer.listen(segmentsProvider(t1TripId), (_, _) {});
        await rollbackContainer.read(segmentsProvider(t1TripId).future);

        final originalType = rollbackContainer
            .read(segmentsProvider(t1TripId))
            .requireValue[10]!
            .type;

        // Supprime le segment du store (le notifier ne le sait pas encore)
        backend.store.removeSegment(10);

        final draft = SegmentDraft(
          type: SegmentType.car,
          startVertexId: 10,
          endVertexId: 11,
        );
        await rollbackContainer
            .read(segmentsProvider(t1TripId).notifier)
            .updateSegment(10, draft);

        final segments = rollbackContainer
            .read(segmentsProvider(t1TripId))
            .requireValue;
        expect(segments[10]?.type, originalType);
      },
    );

    test("deleteSegment : le segment disparaît de l'état", () async {
      // Given: segments de t1 chargés
      // When: deleteSegment(10) est appelé
      // Then: segment 10 n'est plus dans l'état
      container.listen(segmentsProvider(t1TripId), (_, _) {});
      await container.read(segmentsProvider(t1TripId).future);

      await container
          .read(segmentsProvider(t1TripId).notifier)
          .deleteSegment(10);

      final segments = container.read(segmentsProvider(t1TripId)).requireValue;
      expect(segments.containsKey(10), isFalse);
      expect(segments.containsKey(11), isTrue);
    });
  });

  // =========================================================================
  // VertexRepository — couche données
  // =========================================================================

  group('VertexRepository avec Fake Client', () {
    // ── getVertices ──────────────────────────────────────────────────────────

    group('getVertices', () {
      test('retourne tous les vertices du trip t1', () async {
        // Given: store seedé avec t1 (5 vertices)
        // When: getVertices(t1.id) est appelé
        // Then: les 5 vertices sont retournés
        final (:repo, store: _) = buildVertexRepo(exploreSeed);

        final vertices = expectRight(await repo.getVertices(t1TripId));

        expect(vertices, hasLength(t1Vertices.length));
      });

      test('retourne les coordonnées correctes des vertices', () async {
        // Given: vertex 10 = LatLng(48.8566, 2.3522) (Paris)
        // When: getVertices(t1.id) est appelé
        // Then: les coordonnées sont fidèles
        final (:repo, store: _) = buildVertexRepo(exploreSeed);

        final vertices = expectRight(await repo.getVertices(t1TripId));
        final v10 = vertices.firstWhere((v) => v.id == 10);

        expect(v10.latLng.latitude, closeTo(48.8566, 0.001));
        expect(v10.latLng.longitude, closeTo(2.3522, 0.001));
      });

      test('retourne une liste vide pour un trip sans vertices', () async {
        // Given: un trip sans vertices dans le store
        // When: getVertices est appelé
        // Then: liste vide sans erreur
        final seed = emptyTopologySeed(tripId: 98);
        final (:repo, store: _) = buildVertexRepo([seed]);

        final vertices = expectRight(await repo.getVertices(98));

        expect(vertices, isEmpty);
      });

      test('retourne ServerFailure pour un trip inconnu', () async {
        // Given: tripId 999 n'est pas dans le store
        // When: getVertices(999) est appelé
        // Then: Left(ServerFailure) est retourné
        final (:repo, store: _) = buildVertexRepo(exploreSeed);

        final result = await repo.getVertices(999);

        expect(result.isLeft(), isTrue);
        result.fold(
          (f) => expect(f, isA<ServerFailure>()),
          (_) => fail('Expected Left'),
        );
      });
    });

    // ── createVertex ─────────────────────────────────────────────────────────

    group('createVertex', () {
      test('crée un vertex avec les bonnes coordonnées', () async {
        // Given: t1 dans le store
        // When: createVertex est appelé avec des coordonnées précises
        // Then: le vertex est créé avec les mêmes coordonnées
        final (:repo, store: _) = buildVertexRepo(exploreSeed);
        final latLng = LatLng(45.0, 3.0);

        final created = expectRight(await repo.createVertex(t1TripId, latLng));

        expect(created.latLng.latitude, closeTo(45.0, 0.001));
        expect(created.latLng.longitude, closeTo(3.0, 0.001));
      });

      test('le vertex créé est accessible dans le store', () async {
        // Given: t1 dans le store
        // When: createVertex est appelé
        // Then: le nouveau vertex est présent dans le store sous-jacent
        final (:repo, :store) = buildVertexRepo(exploreSeed);
        final latLng = LatLng(44.0, 2.0);

        final created = expectRight(await repo.createVertex(t1TripId, latLng));

        expect(store.verticesMap.containsKey(created.id), isTrue);
      });

      test('retourne ServerFailure si le trip est inconnu', () async {
        // Given: tripId 999 n'est pas dans le store
        // When: createVertex(999, ...) est appelé
        // Then: Left(ServerFailure) est retourné
        final (:repo, store: _) = buildVertexRepo(exploreSeed);

        final result = await repo.createVertex(999, LatLng(0, 0));

        expect(result.isLeft(), isTrue);
      });
    });

    // ── moveVertex ────────────────────────────────────────────────────────────

    group('moveVertex', () {
      test('déplace un vertex à une nouvelle position', () async {
        // Given: vertex 10 à Paris (48.8566, 2.3522)
        // When: moveVertex est appelé avec de nouvelles coordonnées
        // Then: le vertex a ses nouvelles coordonnées
        final (:repo, store: _) = buildVertexRepo(exploreSeed);
        final newLatLng = LatLng(46.0, 4.0);

        final moved = expectRight(await repo.moveVertex(10, newLatLng));

        expect(moved.id, 10);
        expect(moved.latLng.latitude, closeTo(46.0, 0.001));
        expect(moved.latLng.longitude, closeTo(4.0, 0.001));
      });

      test('le store reflète la nouvelle position du vertex', () async {
        // Given: vertex 11 de t1
        // When: moveVertex est appelé
        // Then: le store contient les nouvelles coordonnées
        final (:repo, :store) = buildVertexRepo(exploreSeed);
        final newLatLng = LatLng(47.5, 1.5);

        expectRight(await repo.moveVertex(11, newLatLng));

        final updatedVertex = store.verticesMap[11]!;
        expect(updatedVertex.latLng.latitude, closeTo(47.5, 0.001));
      });
    });

    // ── deleteVertex ──────────────────────────────────────────────────────────

    group('deleteVertex', () {
      test('supprime le vertex du store', () async {
        // Given: vertex 10 dans le store
        // When: deleteVertex(10) est appelé
        // Then: le vertex n'est plus dans le store
        final (:repo, :store) = buildVertexRepo(exploreSeed);

        expectRight(await repo.deleteVertex(10));

        expect(store.verticesMap.containsKey(10), isFalse);
      });

      test('retourne ServerFailure pour un vertex inconnu', () async {
        // Given: aucun vertex avec l'id 9999
        // When: deleteVertex(9999) est appelé
        // Then: Left(ServerFailure) est retourné
        final (:repo, store: _) = buildVertexRepo(exploreSeed);

        final result = await repo.deleteVertex(9999);

        expect(result.isLeft(), isTrue);
        result.fold(
          (f) => expect(f, isA<ServerFailure>()),
          (_) => fail('Expected Left'),
        );
      });
    });
  });

  // =========================================================================
  // VerticesNotifier — couche application
  // =========================================================================

  group('VerticesNotifier avec Fake Client', () {
    late ProviderContainer container;

    setUp(() {
      container = buildContainer(exploreSeed);
    });

    tearDown(() {
      container.dispose();
    });

    test(
      'chargement initial : tous les vertices de t1 sont présents',
      () async {
        // Given: store seedé avec t1 (5 vertices)
        // When: VerticesNotifier(t1.id) s'initialise
        // Then: les 5 vertices sont dans l'état
        container.listen(verticesProvider(t1TripId), (_, _) {});

        final vertices = await container.read(
          verticesProvider(t1TripId).future,
        );

        expect(vertices, hasLength(t1Vertices.length));
        expect(vertices.containsKey(10), isTrue);
      },
    );

    test("createVertex : le nouveau vertex apparaît dans l'état", () async {
      // Given: vertices de t1 chargés
      // When: createVertex est appelé
      // Then: l'état contient le nouveau vertex
      container.listen(verticesProvider(t1TripId), (_, _) {});
      await container.read(verticesProvider(t1TripId).future);

      final newLatLng = LatLng(43.0, 1.0);
      await container
          .read(verticesProvider(t1TripId).notifier)
          .createVertex(newLatLng);

      final vertices = container.read(verticesProvider(t1TripId)).requireValue;
      expect(vertices.length, t1Vertices.length + 1);

      final nouveau = vertices.values.firstWhere(
        (v) => (v.latLng.latitude - 43.0).abs() < 0.001,
      );
      expect(nouveau.latLng.longitude, closeTo(1.0, 0.001));
    });

    test(
      "moveVertex : la position du vertex est mise à jour dans l'état",
      () async {
        // Given: vertex 10 de t1 chargé
        // When: moveVertex est appelé avec de nouvelles coordonnées
        // Then: l'état contient les nouvelles coordonnées
        container.listen(verticesProvider(t1TripId), (_, _) {});
        await container.read(verticesProvider(t1TripId).future);

        final newLatLng = LatLng(50.0, 5.0);
        await container
            .read(verticesProvider(t1TripId).notifier)
            .moveVertex(10, newLatLng);

        final vertices = container
            .read(verticesProvider(t1TripId))
            .requireValue;
        expect(vertices[10]?.latLng.latitude, closeTo(50.0, 0.001));
        expect(vertices[10]?.latLng.longitude, closeTo(5.0, 0.001));
      },
    );

    test("deleteVertex : le vertex disparaît de l'état", () async {
      // Given: vertices de t1 chargés
      // When: deleteVertex(10) est appelé
      // Then: vertex 10 n'est plus dans l'état, les autres sont présents
      container.listen(verticesProvider(t1TripId), (_, _) {});
      await container.read(verticesProvider(t1TripId).future);

      await container
          .read(verticesProvider(t1TripId).notifier)
          .deleteVertex(10);

      final vertices = container.read(verticesProvider(t1TripId)).requireValue;
      expect(vertices.containsKey(10), isFalse);
      expect(vertices.containsKey(11), isTrue);
    });

    test(
      'deleteVertex rollback : le vertex est restauré si le serveur échoue',
      () async {
        // Given: vertices de t1 chargés
        //   Et: vertex 10 supprimé du store (panne serveur)
        // When: deleteVertex(10) est appelé via le notifier
        // Then: vertex 10 est restauré dans l'état (rollback)
        final backend = buildFakeBackend(exploreSeed);
        final rollbackContainer = buildContainer([], backend: backend);
        addTearDown(rollbackContainer.dispose);
        rollbackContainer.listen(verticesProvider(t1TripId), (_, _) {});
        await rollbackContainer.read(verticesProvider(t1TripId).future);

        // Supprime vertex 10 du store (le notifier ne le sait pas encore)
        backend.store.removeVertex(10);

        await rollbackContainer
            .read(verticesProvider(t1TripId).notifier)
            .deleteVertex(10);

        final vertices = rollbackContainer
            .read(verticesProvider(t1TripId))
            .requireValue;
        // Le rollback restaure vertex 10 dans l'état
        expect(vertices.containsKey(10), isTrue);
      },
    );
  });
}
