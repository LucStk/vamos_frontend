import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trip_domain/trip_domain.dart';
import 'package:vamos_cartographie/features/shared/presentation/widgets/buttons/cancel_button.dart';

import 'package:vamos_cartographie/features/trips/widgets/explorer_empty_view.dart';
import 'package:vamos_cartographie/features/trips/widgets/trip_card.dart';

import '../helpers/trip_test_helpers.dart';

void main() {
  late ObservableTripStore tripStore;
  late FakeTripHandler fakeTripHandler;
  late FakeMediaHandler fakeMediaHandler;

  setUp(() {
    tripStore = ObservableTripStore();
    fakeTripHandler = FakeTripHandler(tripStore);
    fakeMediaHandler = FakeMediaHandler();
  });

  Widget pump() => buildExplorerApp(
    tripStore: tripStore,
    fakeTripHandler: fakeTripHandler,
    fakeMediaHandler: fakeMediaHandler,
  );

  group('TripCreatorDialog — ouverture via FAB', () {
    testWidgets('Spinner affiché pendant createBlankTrip', (tester) async {
      // arrange
      fakeTripHandler.createBlankTripFn = () => Completer<Trip>().future;

      // act
      await tester.pumpWidget(pump());
      await tester.pump(); // frame initiale ExplorerPage

      // ✅ Ouvrir le dialog via le FAB d'abord
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle(); // laisser le dialog s'animer

      // Maintenant CancelButton est visible
      await tester.tap(find.byType(CancelButton));
      await tester.pump(const Duration(milliseconds: 100)); // assert
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('TripFormDialog affiché après résolution du Future', (
      tester,
    ) async {
      // arrange — createBlankTripFn non surchargé : retourne un Trip immédiatement

      // act
      await tester.pumpWidget(pump());
      await tester.pump();
      await tester.tap(find.byType(FloatingActionButton));
      await openDialog(tester); // animation d'entrée du DialogRoute
      await tester.pump(); // FutureBuilder résout et reconstruit

      // assert
      expect(find.text('Titre du voyage'), findsOneWidget);
    });

    testWidgets('createBlankTrip appelé exactement une fois', (tester) async {
      // arrange — comportement par défaut du FakeTripHandler

      // act
      await tester.pumpWidget(pump());
      await tester.pump();
      await tester.tap(find.byType(FloatingActionButton));
      await openDialog(tester);
      await tester.pump();

      // assert
      expect(fakeTripHandler.createCalls, equals(1));
    });

    testWidgets('Le store contient le trip créé après ouverture du dialog', (
      tester,
    ) async {
      // arrange
      expect(tripStore.store, isEmpty);

      // act
      await tester.pumpWidget(pump());
      await tester.pump();
      await tester.tap(find.byType(FloatingActionButton));
      await openDialog(tester);
      await tester.pump();

      // assert
      expect(tripStore.store, isNotEmpty);
    });

    testWidgets(
      'Fermer le dialog (×) → ExplorerEmptyView disparaît, TripCard visible',
      (tester) async {
        // arrange — le store sera rempli au tap FAB via le FakeTripHandler

        // act
        await tester.pumpWidget(pump());
        await tester.pump();
        await tester.tap(find.byType(FloatingActionButton));
        await openDialog(tester);
        await tester.pump(); // FutureBuilder résout → TripFormDialog affiché

        await tester.tap(find.byIcon(Icons.close));
        await tester.pump(); // fermeture du dialog amorcée
        await tester.pump(
          const Duration(milliseconds: 500),
        ); // animation de sortie

        // assert
        expect(find.byType(ExplorerEmptyView), findsNothing);
        expect(find.byType(TripCard), findsOneWidget);
      },
    );
  });
}
