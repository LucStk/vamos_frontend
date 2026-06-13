import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vamos_cartographie/core/failure.dart';
import 'package:vamos_cartographie/backend/seeds/explore_seed.dart';
import 'package:vamos_cartographie/core/type/id.dart';
import 'package:vamos_cartographie/features/trips/application/providers/trips_notifier.dart';
import 'package:vamos_cartographie/features/trips/domain/trip.dart';
import 'package:vamos_cartographie/testing/backend/fixtures/fixtures.dart';

import '../../../helpers/fake_backend_builder.dart';

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

/// Extrait la valeur Right ou fait échouer le test avec le message de l'erreur.
T expectRight<T>(Either<Failure, T> result) {
  return result.fold((l) {
    fail('Expected Right but got Left: ${l.message}');
  }, (r) => r);
}

void main() {
  // =========================================================================
  // TripRepository — couche données
  // =========================================================================

  group('TripRepository avec Fake Client', () {
    // ── getAllTrips ─────────────────────────────────────────────────────────

    group('getAllTrips', () {
      test('retourne tous les trips du store', () async {
        // Given: store seedé avec t1, t2, t3
        // When: getAllTrips est appelé
        // Then: les 3 trips sont retournés avec les bons titres
        final (:repo, store: _) = buildTripRepo(exploreSeed);

        final trips = expectRight(await repo.getAllTrips());

        expect(trips, hasLength(3));
        expect(
          trips.map((t) => t.title),
          containsAll([t1.title, t2.title, t3.title]),
        );
      });

      test('retourne une liste vide si le store est vide', () async {
        // Given: store sans trips
        // When: getAllTrips est appelé
        // Then: liste vide sans erreur
        final (:repo, store: _) = buildTripRepo([]);

        final trips = expectRight(await repo.getAllTrips());

        expect(trips, isEmpty);
      });

      test('retourne les données de chaque trip correctement', () async {
        // Given: t1 avec date, description et images
        // When: getAllTrips est appelé
        // Then: les champs de t1 sont mappés fidèlement
        final (:repo, store: _) = buildTripRepo(exploreSeed);

        final trips = expectRight(await repo.getAllTrips());
        final trip1 = trips.firstWhere((t) => t.id == t1.id);

        expect(trip1.title, t1.title);
        expect(trip1.description, t1.description);
        expect(trip1.date, t1.date);
        expect(trip1.images, hasLength(t1.images.length));
      });
    });

    // ── getTrip ────────────────────────────────────────────────────────────

    group('getTrip', () {
      test("retourne le trip correspondant à l'id", () async {
        // Given: t2 dans le store
        // When: getTrip(t2.id) est appelé
        // Then: le trip retourné correspond à t2
        final (:repo, store: _) = buildTripRepo(exploreSeed);

        final trip = expectRight(await repo.getTrip(t2.id));

        expect(trip.id, t2.id);
        expect(trip.title, t2.title);
      });

      test('retourne ServerFailure pour un id inconnu', () async {
        // Given: aucun trip avec l'id 999
        // When: getTrip(999) est appelé
        // Then: Left(ServerFailure) est retourné
        final (:repo, store: _) = buildTripRepo(exploreSeed);

        final result = await repo.getTrip(Id<Trip>(999));

        expect(result.isLeft(), isTrue);
        result.fold(
          (failure) => expect(failure, isA<ServerFailure>()),
          (_) => fail('Expected Left'),
        );
      });
    });

    // ── createTrip ─────────────────────────────────────────────────────────

    group('createTrip', () {
      test('crée un trip avec titre uniquement', () async {
        // Given: un draft avec titre seulement
        // When: createTrip est appelé
        // Then: le trip est créé avec le bon titre et un id généré
        final (:repo, store: _) = buildTripRepo(exploreSeed);
        final draft = TripDraft(title: 'Nouveau voyage');

        final created = expectRight(await repo.createTrip(draft));

        expect(created.title, 'Nouveau voyage');
        expect(created.id, isNotNull);
      });

      test('crée un trip avec tous les champs renseignés', () async {
        // Given: un draft complet
        // When: createTrip est appelé
        // Then: tous les champs sont persistés
        final (:repo, store: _) = buildTripRepo(exploreSeed);
        final draft = TripDraft(
          title: 'Tour du Mont-Blanc',
          description: 'Le célèbre tour',
          date: DateTime(2025, 8, 1),
        );

        final created = expectRight(await repo.createTrip(draft));

        expect(created.title, 'Tour du Mont-Blanc');
        expect(created.description, 'Le célèbre tour');
        expect(created.date, DateTime(2025, 8, 1));
      });

      test('crée un trip sans description (champ optionnel)', () async {
        // Given: un draft sans description
        // When: createTrip est appelé
        // Then: la description est vide sans erreur
        final (:repo, store: _) = buildTripRepo(exploreSeed);
        final draft = TripDraft(title: 'Sans description', description: '');

        final created = expectRight(await repo.createTrip(draft));

        expect(created.description, '');
      });

      test('crée un trip sans date (champ optionnel)', () async {
        // Given: un draft sans date
        // When: createTrip est appelé
        // Then: la date est null sans erreur
        final (:repo, store: _) = buildTripRepo(exploreSeed);
        final draft = TripDraft(title: 'Sans date', date: null);

        final created = expectRight(await repo.createTrip(draft));

        expect(created.date, isNull);
      });

      test('chaque trip créé reçoit un id unique', () async {
        // Given: deux créations successives
        // When: createTrip est appelé deux fois
        // Then: les ids sont différents
        final (:repo, store: _) = buildTripRepo(exploreSeed);

        final trip1 = expectRight(await repo.createTrip(TripDraft(title: 'A')));
        final trip2 = expectRight(await repo.createTrip(TripDraft(title: 'B')));

        expect(trip1.id, isNot(trip2.id));
      });
    });

    // ── updateTrip ─────────────────────────────────────────────────────────

    group('updateTrip', () {
      test('met à jour le titre du trip', () async {
        // Given: t1 dans le store
        // When: updateTrip est appelé avec un nouveau titre
        // Then: le titre est mis à jour
        final (:repo, store: _) = buildTripRepo(exploreSeed);
        final draft = t1.toDraft().copyWith(title: 'Nouveau titre');

        final updated = expectRight(await repo.updateTrip(t1.id, draft));

        expect(updated.title, 'Nouveau titre');
        expect(updated.id, t1.id);
      });

      test('met à jour la description du trip', () async {
        // Given: t2 dans le store
        // When: updateTrip est appelé avec une nouvelle description
        // Then: la description est mise à jour
        final (:repo, store: _) = buildTripRepo(exploreSeed);
        final draft = t2.toDraft().copyWith(
          description: 'Nouvelle description',
        );

        final updated = expectRight(await repo.updateTrip(t2.id, draft));

        expect(updated.description, 'Nouvelle description');
      });

      test(
        'efface la description quand elle est vide (mise à null serveur)',
        () async {
          // Given: t1 avec une description existante
          // When: updateTrip est appelé avec une description vide
          // Then: la description est effacée côté serveur
          final (:repo, store: _) = buildTripRepo(exploreSeed);
          final draft = t1.toDraft().copyWith(description: '');

          final updated = expectRight(await repo.updateTrip(t1.id, draft));

          expect(updated.description, '');
        },
      );

      test('met à jour la date du trip', () async {
        // Given: t3 dans le store
        // When: updateTrip est appelé avec une nouvelle date
        // Then: la date est mise à jour
        final (:repo, store: _) = buildTripRepo(exploreSeed);
        final newDate = DateTime(2026, 1, 15);
        final draft = t3.toDraft().copyWith(date: newDate);

        final updated = expectRight(await repo.updateTrip(t3.id, draft));

        expect(updated.date, newDate);
      });

      test('retourne ServerFailure pour un trip inconnu', () async {
        // Given: aucun trip avec l'id 999
        // When: updateTrip(999, ...) est appelé
        // Then: Left(ServerFailure) est retourné
        final (:repo, store: _) = buildTripRepo(exploreSeed);
        final draft = TripDraft(title: 'Inexistant');

        final result = await repo.updateTrip(Id<Trip>(999), draft);

        expect(result.isLeft(), isTrue);
        result.fold(
          (f) => expect(f, isA<ServerFailure>()),
          (_) => fail('Expected Left'),
        );
      });
    });

    // ── deleteTrip ─────────────────────────────────────────────────────────

    group('deleteTrip', () {
      test('supprime le trip du store', () async {
        // Given: t1 dans le store
        // When: deleteTrip(t1.id) est appelé
        // Then: le trip n'est plus accessible
        final (:repo, :store) = buildTripRepo(exploreSeed);

        expectRight(await repo.deleteTrip(t1.id));

        expect(store.tripsMap.containsKey(t1.id), isFalse);
      });

      test('le store ne contient plus que les trips non supprimés', () async {
        // Given: 3 trips dans le store
        // When: t2 est supprimé
        // Then: t1 et t3 sont toujours présents, t2 non
        final (:repo, :store) = buildTripRepo(exploreSeed);

        expectRight(await repo.deleteTrip(t2.id));

        expect(store.tripsMap.containsKey(t1.id), isTrue);
        expect(store.tripsMap.containsKey(t2.id), isFalse);
        expect(store.tripsMap.containsKey(t3.id), isTrue);
      });

      test('supprime aussi les waypoints et vertices associés', () async {
        // Given: t1 avec des waypoints et vertices
        // When: deleteTrip(t1.id) est appelé
        // Then: les waypoints de t1 sont supprimés du store
        final (:repo, :store) = buildTripRepo(exploreSeed);
        final waypointCountBefore = store.waypointsMap.length;

        expectRight(await repo.deleteTrip(t1.id));

        expect(store.waypointsMap.length, lessThan(waypointCountBefore));
      });
    });
  });

  // =========================================================================
  // TripsNotifier — couche application (via ProviderContainer)
  // =========================================================================

  group('TripsNotifier avec Fake Client', () {
    late ProviderContainer container;

    setUp(() {
      container = buildContainer(exploreSeed);
    });

    tearDown(() {
      container.dispose();
    });

    // ── chargement initial ─────────────────────────────────────────────────

    test('chargement initial : tous les trips seedés sont présents', () async {
      // Given: store seedé avec t1, t2, t3
      // When: TripsNotifier s'initialise
      // Then: les 3 trips sont dans l'état
      container.listen(tripsProvider, (_, _) {});

      final trips = await container.read(tripsProvider.future);

      expect(trips, hasLength(3));
      expect(trips.containsKey(t1.id), isTrue);
      expect(trips.containsKey(t2.id), isTrue);
      expect(trips.containsKey(t3.id), isTrue);
    });

    test('store vide : état initial est une Map vide', () async {
      // Given: store sans trips
      // When: TripsNotifier s'initialise
      // Then: état est vide
      final emptyContainer = buildContainer([]);
      addTearDown(emptyContainer.dispose);
      emptyContainer.listen(tripsProvider, (_, _) {});

      final trips = await emptyContainer.read(tripsProvider.future);

      expect(trips, isEmpty);
    });

    // ── createTrip ─────────────────────────────────────────────────────────

    test("createTrip : le nouveau trip apparaît dans l'état", () async {
      // Given: state chargé avec 3 trips
      // When: createTrip est appelé
      // Then: l'état contient 4 trips dont le nouveau
      container.listen(tripsProvider, (_, _) {});
      await container.read(tripsProvider.future);

      final draft = TripDraft(
        title: 'Chemin de Compostelle',
        description: 'Via Turonensis',
        date: DateTime(2025, 5, 1),
      );
      await container.read(tripsProvider.notifier).createTrip(draft);

      final trips = container.read(tripsProvider).requireValue;
      expect(trips, hasLength(4));

      final nouveau = trips.values.firstWhere(
        (t) => t.value.title == 'Chemin de Compostelle',
      );
      expect(nouveau.value.description, 'Via Turonensis');
      expect(nouveau.value.date, DateTime(2025, 5, 1));
    });

    test("createTrip sans description : champ vide dans l'état", () async {
      // Given: state chargé
      // When: createTrip est appelé sans description
      // Then: le trip est créé avec description vide
      container.listen(tripsProvider, (_, _) {});
      await container.read(tripsProvider.future);

      await container
          .read(tripsProvider.notifier)
          .createTrip(TripDraft(title: 'Sans description'));

      final trips = container.read(tripsProvider).requireValue;
      final nouveau = trips.values.firstWhere(
        (t) => t.value.title == 'Sans description',
      );
      expect(nouveau.value.description, '');
    });

    // ── updateTrip ─────────────────────────────────────────────────────────

    test(
      "updateTrip : l'état reflète les données confirmées par le serveur",
      () async {
        // Given: t1 chargé dans l'état
        // When: updateTrip est appelé avec un nouveau titre
        // Then: l'état contient le titre mis à jour
        container.listen(tripsProvider, (_, _) {});
        await container.read(tripsProvider.future);

        final draft = t1.toDraft().copyWith(title: 'Bretagne revisitée');
        await container.read(tripsProvider.notifier).updateTrip(t1.id, draft);

        final trips = container.read(tripsProvider).requireValue;
        expect(trips[t1.id]?.value.title, 'Bretagne revisitée');
      },
    );

    test(
      "updateTrip rollback : l'état revient à la valeur originale si le serveur échoue",
      () async {
        // Given: t1 chargé dans l'état
        //   Et: t1 est supprimé du store sous-jacent (simule une panne serveur)
        // When: updateTrip est appelé sur le t1 "fantôme"
        // Then: l'état est restauré avec le titre original de t1
        final backend = buildFakeBackend(exploreSeed);
        final rollbackContainer = buildContainer([], backend: backend);
        addTearDown(rollbackContainer.dispose);
        rollbackContainer.listen(tripsProvider, (_, _) {});
        await rollbackContainer.read(tripsProvider.future);

        // Supprime t1 directement du store (le notifier ne le sait pas encore)
        backend.store.removeTrip(t1.id);

        final draft = t1.toDraft().copyWith(title: 'Titre non sauvegardé');
        await rollbackContainer
            .read(tripsProvider.notifier)
            .updateTrip(t1.id, draft);

        final trips = rollbackContainer.read(tripsProvider).requireValue;
        // Le rollback restaure le titre original de t1
        expect(trips[t1.id]?.value.title, t1.title);
      },
    );

    // ── deleteTrip ─────────────────────────────────────────────────────────

    test("deleteTrip : le trip disparaît de l'état", () async {
      // Given: t2 chargé dans l'état
      // When: deleteTrip(t2.id) est appelé
      // Then: t2 n'est plus dans l'état, les autres trips sont présents
      container.listen(tripsProvider, (_, _) {});
      await container.read(tripsProvider.future);

      await container.read(tripsProvider.notifier).deleteTrip(t2.id);

      final trips = container.read(tripsProvider).requireValue;
      expect(trips.containsKey(t2.id), isFalse);
      expect(trips.containsKey(t1.id), isTrue);
      expect(trips.containsKey(t3.id), isTrue);
    });

    // ── refresh ────────────────────────────────────────────────────────────

    test('refresh : recharge les données depuis le store', () async {
      // Given: state chargé avec 3 trips
      //   Et: un nouveau trip ajouté directement dans le store
      final backend = buildFakeBackend(exploreSeed);
      final refreshContainer = buildContainer([], backend: backend);
      addTearDown(refreshContainer.dispose);
      refreshContainer.listen(tripsProvider, (_, _) {});
      await refreshContainer.read(tripsProvider.future);

      // Injection directe dans le store (simule une création externe)
      final newTripId = backend.store.nextTripId.next();
      backend.store.addTrip(
        Trip(id: Id<Trip>(newTripId), title: 'Ajout externe'),
      );

      // When: refresh est appelé
      await refreshContainer.read(tripsProvider.notifier).refresh();

      // Then: l'état reflète la nouvelle réalité du store
      final trips = refreshContainer.read(tripsProvider).requireValue;
      expect(trips, hasLength(4));
      expect(trips[Id<Trip>(newTripId)]?.value.title, 'Ajout externe');
    });
  });
}
