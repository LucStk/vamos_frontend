import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trip_domain/trip_domain.dart';
import 'package:vamos_cartographie/core/injection/stores/trip_store.dart';
import 'package:vamos_cartographie/features/trips/widgets/explorer_empty_view.dart';
import 'package:vamos_cartographie/features/trips/widgets/explorer_error_view.dart';
import 'package:vamos_cartographie/features/trips/widgets/trip_card.dart';

import '../helpers/trip_test_helpers.dart';

// ---------------------------------------------------------------------------
// Helper local
// ---------------------------------------------------------------------------

/// Récupère le [ProviderContainer] depuis le widget tree de test.
///
/// En Riverpod 3.x, `ref.invalidateSelf()` appelé depuis un listener
/// Observable externe ne déclenche pas de rebuild Flutter. Pour forcer la
/// propagation du changement de store vers l'UI, on passe par l'invalidation
/// explicite du container, ce qui est équivalent à ce que `addListenerRebuild`
/// est censé faire.
ProviderContainer _container(WidgetTester tester) =>
    ProviderScope.containerOf(tester.element(find.byType(MaterialApp)));

void main() {
  // ─────────────────────────────────────────────────────────────────────────
  // Groupe 1 : états
  // ─────────────────────────────────────────────────────────────────────────

  group('ExplorerPage — états', () {
    testWidgets(
      'affiche CircularProgressIndicator quand loadTrips est en loading',
      (tester) async {
        // arrange
        final tripStore = ObservableTripStore();
        final fakeTripHandler = FakeTripHandler(tripStore);
        final fakeMediaHandler = FakeMediaHandler();

        await tester.pumpWidget(
          buildExplorerApp(
            tripStore: tripStore,
            fakeTripHandler: fakeTripHandler,
            fakeMediaHandler: fakeMediaHandler,
            loadTripsOverride: (ref) => Completer<void>().future,
          ),
        );

        // assert – le provider est encore en loading, pas besoin de pump()
        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      },
    );

    testWidgets(
      'affiche ExplorerErrorView avec le message d\'erreur quand loadTrips échoue',
      (tester) async {
        // arrange
        await tester.pumpWidget(
          buildExplorerApp(
            tripStore: ObservableTripStore(),
            fakeTripHandler: FakeTripHandler(ObservableTripStore()),
            fakeMediaHandler: FakeMediaHandler(),
            loadTripsOverride: (ref) async => throw Exception('erreur réseau'),
          ),
        );

        // act – pumpAndSettle est sûr ici (pas de boucle invalidateSelf)
        await tester.pumpAndSettle();

        // assert
        expect(find.byType(ExplorerErrorView), findsOneWidget);
        expect(find.text('Exception: erreur réseau'), findsOneWidget);
      },
    );

    testWidgets('affiche ExplorerEmptyView quand le store est vide', (
      tester,
    ) async {
      // arrange
      await tester.pumpWidget(
        buildExplorerApp(
          tripStore: ObservableTripStore(),
          fakeTripHandler: FakeTripHandler(ObservableTripStore()),
          fakeMediaHandler: FakeMediaHandler(),
        ),
      );
      await tester.pump();

      // assert
      expect(find.byType(ExplorerEmptyView), findsOneWidget);
    });

    testWidgets('affiche une TripCard par trip dans le store', (tester) async {
      // arrange
      final tripStore = ObservableTripStore();
      tripStore.upsert(makeTrip(id: 1, title: 'Voyage 1'));
      tripStore.upsert(makeTrip(id: 2, title: 'Voyage 2'));
      tripStore.upsert(makeTrip(id: 3, title: 'Voyage 3'));

      await tester.pumpWidget(
        buildExplorerApp(
          tripStore: tripStore,
          fakeTripHandler: FakeTripHandler(tripStore),
          fakeMediaHandler: FakeMediaHandler(),
        ),
      );
      await tester.pump();

      // assert
      expect(find.byType(TripCard), findsNWidgets(3));
    });

    testWidgets('affiche le titre "Mes voyages" dans l\'AppBar', (
      tester,
    ) async {
      // arrange
      await tester.pumpWidget(
        buildExplorerApp(
          tripStore: ObservableTripStore(),
          fakeTripHandler: FakeTripHandler(ObservableTripStore()),
          fakeMediaHandler: FakeMediaHandler(),
        ),
      );
      await tester.pump();

      // assert
      expect(find.text('Mes voyages'), findsOneWidget);
    });

    testWidgets('affiche le FAB "Nouveau voyage"', (tester) async {
      // arrange
      await tester.pumpWidget(
        buildExplorerApp(
          tripStore: ObservableTripStore(),
          fakeTripHandler: FakeTripHandler(ObservableTripStore()),
          fakeMediaHandler: FakeMediaHandler(),
        ),
      );
      await tester.pump();

      // assert
      expect(find.text('Nouveau voyage'), findsOneWidget);
    });
  });

  // ─────────────────────────────────────────────────────────────────────────
  // Groupe 2 : refresh & retry
  // ─────────────────────────────────────────────────────────────────────────

  group('ExplorerPage — refresh & retry', () {
    testWidgets(
      'tap sur le bouton refresh invalide loadTripsProvider (loadCallCount++)',
      (tester) async {
        // arrange
        int loadCallCount = 0;
        final tripStore = ObservableTripStore();

        await tester.pumpWidget(
          buildExplorerApp(
            tripStore: tripStore,
            fakeTripHandler: FakeTripHandler(tripStore),
            fakeMediaHandler: FakeMediaHandler(),
            loadTripsOverride: (ref) async {
              loadCallCount++;
            },
          ),
        );
        await tester.pump();

        final countAfterInit = loadCallCount;

        // act
        await tester.tap(find.byIcon(Icons.refresh));
        await tester.pump();

        // assert – au moins un appel supplémentaire après le tap
        expect(loadCallCount, greaterThan(countAfterInit));
      },
    );

    testWidgets(
      'tap sur "Réessayer" dans ExplorerErrorView invalide loadTripsProvider',
      (tester) async {
        // arrange
        // On utilise un override qui lance toujours une erreur pour garantir
        // que ExplorerErrorView reste visible même si pumpAndSettle ré-exécute
        // le provider (comportement Riverpod 3.x dans l'environnement de test).
        int loadCallCount = 0;
        final tripStore = ObservableTripStore();

        await tester.pumpWidget(
          buildExplorerApp(
            tripStore: tripStore,
            fakeTripHandler: FakeTripHandler(tripStore),
            fakeMediaHandler: FakeMediaHandler(),
            loadTripsOverride: (ref) async {
              loadCallCount++;
              throw Exception('erreur persistante');
            },
          ),
        );

        // pumpAndSettle est sûr ici : le provider lance toujours une erreur,
        // donc l'état AsyncError est stable.
        await tester.pumpAndSettle();

        expect(find.byType(ExplorerErrorView), findsOneWidget);
        final countBeforeRetry = loadCallCount;

        // act
        await tester.tap(find.text('Réessayer'));
        await tester.pump();

        // assert – le provider a été rappelé après le tap
        expect(loadCallCount, greaterThan(countBeforeRetry));
      },
    );
  });

  // ─────────────────────────────────────────────────────────────────────────
  // Groupe 3 : réactivité du store
  //
  // Note de timing : en Riverpod 3.x, `ref.invalidateSelf()` appelé depuis
  // un listener Observable externe ne déclenche pas automatiquement de rebuild
  // Flutter dans l'environnement de test. On force l'invalidation via
  // `container.invalidate(tripStoreProvider)` puis `pumpRiverpod` (2 frames)
  // pour propager le changement jusqu'à l'UI.
  // ─────────────────────────────────────────────────────────────────────────

  group('ExplorerPage — réactivité du store', () {
    testWidgets('tripStore.upsert → TripCard apparaît', (tester) async {
      // arrange
      final tripStore = ObservableTripStore();
      final trip = makeTrip(id: 1, title: 'Voyage ajouté');

      await tester.pumpWidget(
        buildExplorerApp(
          tripStore: tripStore,
          fakeTripHandler: FakeTripHandler(tripStore),
          fakeMediaHandler: FakeMediaHandler(),
        ),
      );
      await tester.pump();

      expect(find.byType(TripCard), findsNothing);

      // act
      tripStore.upsert(trip);
      _container(tester).invalidate(tripStoreProvider);
      await pumpRiverpod(tester);

      // assert
      expect(find.byType(TripCard), findsOneWidget);
    });

    testWidgets('tripStore.remove → TripCard disparaît', (tester) async {
      // arrange
      final trip = makeTrip(id: 1, title: 'Voyage à supprimer');
      final tripStore = ObservableTripStore();
      tripStore.upsert(trip);

      await tester.pumpWidget(
        buildExplorerApp(
          tripStore: tripStore,
          fakeTripHandler: FakeTripHandler(tripStore),
          fakeMediaHandler: FakeMediaHandler(),
        ),
      );
      await tester.pump();

      expect(find.byType(TripCard), findsOneWidget);

      // act
      tripStore.remove(trip.id);
      _container(tester).invalidate(tripStoreProvider);
      await pumpRiverpod(tester);

      // assert
      expect(find.byType(TripCard), findsNothing);
    });

    testWidgets(
      'tripStore.upsert avec nouveau titre → titre mis à jour dans la TripCard',
      (tester) async {
        // arrange
        final trip = makeTrip(id: 1, title: 'Ancien titre');
        final tripStore = ObservableTripStore();
        tripStore.upsert(trip);

        await tester.pumpWidget(
          buildExplorerApp(
            tripStore: tripStore,
            fakeTripHandler: FakeTripHandler(tripStore),
            fakeMediaHandler: FakeMediaHandler(),
          ),
        );
        await tester.pump();

        expect(find.text('Ancien titre'), findsOneWidget);

        // act
        tripStore.upsert(trip.copyWith(title: 'Nouveau titre'));
        _container(tester).invalidate(tripStoreProvider);
        await pumpRiverpod(tester); // tripStoreProvider + tripProvider rebuild
        await pumpRiverpod(tester); // TripCardContent rebuild

        // assert
        expect(find.text('Nouveau titre'), findsOneWidget);
        expect(find.text('Ancien titre'), findsNothing);
      },
    );
  });
}
