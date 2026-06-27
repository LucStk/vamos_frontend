import 'package:domain_core/media.dart';
import 'package:flutter/material.dart';
import 'package:media_application/domain/entities/image_ui_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trip_domain/trip_domain.dart';

import 'package:vamos_cartographie/features/trips/widgets/widgets.dart';

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

  // Construit l'app et la pompe pour la frame initiale d'ExplorerPage.
  Future<void> buildApp(
    WidgetTester tester, {
    List<ImageUiModel> images = const [],
  }) async {
    await tester.pumpWidget(
      buildExplorerApp(
        tripStore: tripStore,
        fakeTripHandler: fakeTripHandler,
        fakeMediaHandler: fakeMediaHandler,
        imagesOverride: images.isEmpty ? null : (ref, id) => images,
      ),
    );
    await tester.pump(); // frame initiale ExplorerPage
  }

  // Ouvre ExplorerPage puis navigue jusqu'à TripEditorDialog.
  Future<void> openEditorDialog(
    WidgetTester tester, {
    String tripTitle = 'Mon voyage',
  }) async {
    await tester.tap(find.text(tripTitle));
    await openDialog(tester); // TripViewerDialog
    await tester.tap(find.text('Modifier'));
    await openDialog(tester); // TripEditorDialog (Future.delayed + showDialog)
  }

  // ---------------------------------------------------------------------------
  // Groupe 1 : ouverture
  // ---------------------------------------------------------------------------

  group('TripEditorDialog — ouverture', () {
    testWidgets(
      'Tap Modifier depuis TripViewerDialog → champ "Titre du voyage" visible',
      (tester) async {
        // arrange
        tripStore.upsert(makeTrip(id: 1, title: 'Mon voyage'));

        // act
        await buildApp(tester);
        await openEditorDialog(tester);

        // assert
        expect(find.text('Titre du voyage'), findsOneWidget);
      },
    );

    testWidgets('Le titre initial du trip est pré-rempli dans le TextField', (
      tester,
    ) async {
      // arrange
      tripStore.upsert(makeTrip(id: 1, title: 'Mon voyage'));

      // act
      await buildApp(tester);
      await openEditorDialog(tester);

      // assert
      expect(find.widgetWithText(TextFormField, 'Mon voyage'), findsOneWidget);
    });
  });

  // ---------------------------------------------------------------------------
  // Groupe 2 : édition
  // ---------------------------------------------------------------------------

  group('TripEditorDialog — édition', () {
    testWidgets(
      'Saisir un nouveau titre + Confirmer → fakeTripHandler.lastUpdated.title == "Nouveau titre"',
      (tester) async {
        // arrange
        tripStore.upsert(makeTrip(id: 1, title: 'Mon voyage'));

        await buildApp(tester);
        await openEditorDialog(tester);

        // act
        await tester.enterText(
          find.widgetWithText(TextFormField, 'Mon voyage'),
          'Nouveau titre',
        );
        await tester.tap(find.text('Confirmer'));
        await tester.pump(); // Navigator.pop amorcé
        await tester.pump(
          const Duration(milliseconds: 500),
        ); // animation de sortie

        // assert
        expect(fakeTripHandler.lastUpdated?.title, equals('Nouveau titre'));
      },
    );

    testWidgets(
      'Après confirmation, la TripCard de la liste affiche le nouveau titre',
      (tester) async {
        // arrange
        tripStore.upsert(makeTrip(id: 1, title: 'Mon voyage'));

        await buildApp(tester);
        await openEditorDialog(tester);

        // act
        await tester.enterText(
          find.widgetWithText(TextFormField, 'Mon voyage'),
          'Nouveau titre',
        );
        await tester.tap(find.text('Confirmer'));
        await tester
            .pump(); // _submit() async chain + Navigator.pop de TripEditorDialog
        await tester.pump(
          const Duration(milliseconds: 500),
        ); // animation de sortie — retour à TripViewerDialog

        // Laisser Riverpod propaguer la mise à jour du store PENDANT qu'on est
        // encore dans TripViewerDialog, avant de retourner à ExplorerPage.
        await pumpRiverpod(tester);

        // Fermer TripViewerDialog pour revenir à ExplorerPage
        await tester.tap(find.byIcon(Icons.close));
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 500));

        // assert — le store a été mis à jour, Riverpod a propagуé, la TripCard
        // affiche désormais le nouveau titre.
        expect(find.byType(TripCard), findsOneWidget);
        expect(find.text('Nouveau titre'), findsOneWidget);
        expect(find.text('Mon voyage'), findsNothing);
      },
    );
  });

  // ---------------------------------------------------------------------------
  // Groupe 3 : carousel éditeur
  // ---------------------------------------------------------------------------

  group('TripEditorDialog — carousel éditeur', () {
    testWidgets(
      'Le carousel affiche les images de entityImagesProvider (trouvées par ValueKey)',
      (tester) async {
        // arrange
        final img1 = makeImageUiModel(key: 'key-1', url: 'https://a.com/1.jpg');
        final img2 = makeImageUiModel(key: 'key-2', url: 'https://a.com/2.jpg');
        tripStore.upsert(makeTrip(id: 1, title: 'Mon voyage'));

        // act
        await buildApp(tester, images: [img1, img2]);
        await openEditorDialog(tester);

        // assert — chaque thumbnail du PICKER est clé par ValueKey(fileKey).
        // TripViewerDialog est aussi dans l'arbre (sous TripEditorDialog) et
        // utilise les mêmes clés pour ses ThumbnailView — on scope donc la
        // recherche à l'intérieur de TripEditorDialog.
        final inEditor = find.byType(TripEditorDialog);
        expect(
          find.descendant(
            of: inEditor,
            matching: find.byKey(ValueKey(FileKey('key-1'))),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: inEditor,
            matching: find.byKey(ValueKey(FileKey('key-2'))),
          ),
          findsOneWidget,
        );
      },
    );

    testWidgets('Le bouton Icons.add_photo_alternate_outlined est présent', (
      tester,
    ) async {
      // arrange
      tripStore.upsert(makeTrip(id: 1, title: 'Mon voyage'));

      // act
      await buildApp(tester);
      await openEditorDialog(tester);

      // assert
      expect(find.byIcon(Icons.add_photo_alternate_outlined), findsOneWidget);
    });

    testWidgets(
      'Tap sur bouton de suppression Icons.close → fakeMediaHandler.removeCalls.length == 1',
      (tester) async {
        // arrange
        final img = makeImageUiModel(key: 'key-1', url: 'https://a.com/1.jpg');
        tripStore.upsert(makeTrip(id: 1, title: 'Mon voyage'));

        // act
        await buildApp(tester, images: [img]);
        await openEditorDialog(tester);

        // Icons.close est présent à la fois dans le DialogShell (bouton ×)
        // et dans ThumbnailDeleteButton — on cible le bon via sa clé de thumbnail.
        await tester.tap(
          find.descendant(
            of: find.byKey(ValueKey(FileKey('key-1'))),
            matching: find.byIcon(Icons.close),
          ),
        );
        await tester.pump();

        // assert
        expect(fakeMediaHandler.removeCalls.length, equals(1));
      },
    );
  });
}
