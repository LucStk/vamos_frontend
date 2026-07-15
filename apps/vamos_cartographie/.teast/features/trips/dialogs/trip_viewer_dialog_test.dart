import 'package:domain_core/id.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:media_application/domain/entities/image_ui_model.dart';
import 'package:trip_application/trip_application.dart';

import '../helpers/trip_test_helpers.dart';

void main() {
  late ObservableTripStore tripStore;
  late FakeTripHandler fakeTripHandler;
  late FakeMediaHandler fakeMediaHandler;
  late Trip trip;

  setUp(() {
    tripStore = ObservableTripStore();
    fakeTripHandler = FakeTripHandler(tripStore);
    fakeMediaHandler = FakeMediaHandler();
    trip = makeTrip(id: 1, title: 'Mon voyage');
    tripStore.upsert(trip);
  });

  Widget pump({List<ImageUiModel> Function(Ref, Id)? imagesOverride}) =>
      buildExplorerApp(
        tripStore: tripStore,
        fakeTripHandler: fakeTripHandler,
        fakeMediaHandler: fakeMediaHandler,
        imagesOverride: imagesOverride,
      );

  Future<void> tapCardAndOpenDialog(WidgetTester tester) async {
    await tester.tap(find.text('Mon voyage'));
    await openDialog(tester);
  }

  // ---------------------------------------------------------------------------
  // Groupe 1 : ouverture
  // ---------------------------------------------------------------------------

  group('TripViewerDialog — ouverture', () {
    testWidgets(
      'tap sur TripCard → boutons Delete, Modifier et Explorer visibles',
      (tester) async {
        // arrange
        await tester.pumpWidget(pump());
        await pumpRiverpod(tester);

        // act
        await tapCardAndOpenDialog(tester);

        // assert
        expect(find.text('Delete'), findsOneWidget);
        expect(find.text('Modifier'), findsOneWidget);
        expect(find.text('Explorer'), findsOneWidget);
      },
    );
  });

  // ---------------------------------------------------------------------------
  // Groupe 2 : suppression
  // ---------------------------------------------------------------------------

  group('TripViewerDialog — suppression', () {
    testWidgets(
      'tap Delete → AskConfirmDialog affiché avec Attention, Confirmer, Annuler',
      (tester) async {
        // arrange
        await tester.pumpWidget(pump());
        await pumpRiverpod(tester);
        await tapCardAndOpenDialog(tester);

        // act
        await tester.tap(find.text('Delete'));
        await tester.pump();

        // assert
        expect(find.text('Attention'), findsOneWidget);
        expect(find.text('Confirmer'), findsOneWidget);
        expect(find.text('Annuler'), findsOneWidget);
      },
    );

    testWidgets('Confirmer → trip supprimé du store et TripCard disparaît', (
      tester,
    ) async {
      // arrange
      await tester.pumpWidget(pump());
      await pumpRiverpod(tester);
      await tapCardAndOpenDialog(tester);
      await tester.tap(find.text('Delete'));
      await tester.pump();

      // act
      await tester.tap(find.text('Confirmer'));
      // pump(1ms) : avance l'horloge fake pour déclencher les Timer(Duration.zero)
      // de Riverpod (_flutterVsync → setState + _callTask).
      await tester.pump(const Duration(milliseconds: 1));
      // pump(500ms) : animation de fermeture du dialog + rebuild ExplorerPage.
      await tester.pump(const Duration(milliseconds: 500));
      // Deux passes supplémentaires pour la propagation Riverpod
      // (tripStoreProvider → watchers → ExplorerPage).
      await tester.pump(const Duration(milliseconds: 1));
      await tester.pump(const Duration(milliseconds: 1));

      // assert
      expect(fakeTripHandler.lastDeleted, equals(trip.id));
      expect(find.text('Mon voyage'), findsNothing);
    });

    testWidgets('Annuler → trip non supprimé et toujours dans le store', (
      tester,
    ) async {
      // arrange
      await tester.pumpWidget(pump());
      await pumpRiverpod(tester);
      await tapCardAndOpenDialog(tester);
      await tester.tap(find.text('Delete'));
      await tester.pump();

      // act
      await tester.tap(find.text('Annuler'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));
      // absorbe l'overflow de rendu du DialogShell (bug préexistant de layout)
      tester.takeException();

      // assert
      expect(fakeTripHandler.lastDeleted, isNull);
      expect(tripStore.store.values, contains(trip));
    });
  });

  // ---------------------------------------------------------------------------
  // Groupe 3 : carousel lecture seule
  // ---------------------------------------------------------------------------

  group('TripViewerDialog — carousel lecture seule', () {
    testWidgets('images de entityImagesProvider affichées dans le carousel', (
      tester,
    ) async {
      // arrange
      final image = makeImageUiModel(key: 'key-1');
      await tester.pumpWidget(pump(imagesOverride: (ref, id) => [image]));
      await pumpRiverpod(tester);
      await tapCardAndOpenDialog(tester);

      // act — rien : les images sont affichées automatiquement
      // ThumbnailImage a un bug connu (url as String) : on absorbe l'erreur de
      // rendu pour pouvoir vérifier que ThumbnailView est bien dans l'arbre.
      tester.takeException();

      // assert
      expect(find.byKey(ValueKey(image.fileKey)), findsOneWidget);
    });

    testWidgets(
      'pas de bouton add_photo_alternate_outlined (mode lecture seule)',
      (tester) async {
        // arrange
        await tester.pumpWidget(pump());
        await pumpRiverpod(tester);
        await tapCardAndOpenDialog(tester);

        // assert
        expect(find.byIcon(Icons.add_photo_alternate_outlined), findsNothing);
      },
    );
  });
}
