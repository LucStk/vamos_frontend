import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:vamos_cartographie/features/trips/data/datasources/trip_remote_datasource.dart';
import 'package:vamos_cartographie/graphql/graphql.dart';

import '../../../fixtures/ferry_helpers.dart';
import '../../../fixtures/mock_classes.dart';
import '../../../fixtures/trip_fixtures.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Helpers locaux
// ─────────────────────────────────────────────────────────────────────────────

/// Résultat createTrip : GTripFieldsData (implémente GTripFields).
GTripFieldsData _createResult(int id) =>
    GTripFieldsData(id: id, title: 'Créé $id', description: 'Desc', images: []);

/// Résultat updateTrip : GTripFieldsData (implémente GTripFields).
GTripFieldsData _updateResult(int id) => GTripFieldsData(
  id: id,
  title: 'Modifié $id',
  date: null,
  description: 'Desc',
  images: [],
);

void main() {
  late MockFerryClient mockClient;

  setUpAll(() {
    registerFallbackValue(FakeGGetAllTripsReq());
    registerFallbackValue(FakeGGetTripReq());
    registerFallbackValue(FakeGCreateTripReq());
    registerFallbackValue(FakeGUpdateTripReq());
    registerFallbackValue(FakeGDeleteTripReq());
    registerFallbackValue(FakeGDeleteImageFromTripReq());
  });

  setUp(() {
    mockClient = MockFerryClient();
  });

  // ===========================================================================
  // TripRemoteDatasource
  // ===========================================================================

  group('TripRemoteDatasource', () {
    late TripRemoteDatasource datasource;

    setUp(() {
      datasource = TripRemoteDatasource(mockClient);
    });

    // -------------------------------------------------------------------------
    // getAllTrips
    // -------------------------------------------------------------------------

    group('TripRemoteDatasource.getAllTrips', () {
      test('retourne la liste quand la requête réussit', () async {
        final req = GGetAllTripsReq();
        final gqlData = GGetAllTripsData(
          trips: [gTripFieldsData(id: 1), gTripFieldsData(id: 2)],
        );
        when(
          () => mockClient.request(any<GGetAllTripsReq>()),
        ).thenAnswer((_) => Stream.value(okResponse(req, gqlData)));

        final result = await datasource.getAllTrips();

        expect(result, hasLength(2));
        expect(result.first.id, 1);
        expect(result.first.title, 'Tour de test');
      });

      test(
        'lève une Exception si la réponse contient des erreurs GQL',
        () async {
          final req = GGetAllTripsReq();
          when(
            () => mockClient.request(any<GGetAllTripsReq>()),
          ).thenAnswer((_) => Stream.value(errResponse(req)));

          expect(datasource.getAllTrips(), throwsException);
        },
      );

      test('lève une Exception si data est null', () async {
        final req = GGetAllTripsReq();
        when(() => mockClient.request(any<GGetAllTripsReq>())).thenAnswer(
          (_) => Stream.value(nullDataResponse<GGetAllTripsData, Null>(req)),
        );

        expect(datasource.getAllTrips(), throwsException);
      });
    });

    // -------------------------------------------------------------------------
    // getTripById
    // -------------------------------------------------------------------------

    group('TripRemoteDatasource.getTripById', () {
      test('retourne le trip quand la requête réussit', () async {
        final req = GGetTripReq(vars: GGetTripVars(id: 5));
        final gqlData = GGetTripData(trip: gTripDetailData(id: 5));
        when(
          () => mockClient.request(any<GGetTripReq>()),
        ).thenAnswer((_) => Stream.value(okResponse(req, gqlData)));

        final result = await datasource.getTripById(id: 5);

        expect(result.id, 5);
        expect(result.title, 'Tour de test');
        expect(result.images, hasLength(1));
      });

      test(
        'lève une Exception si la réponse contient des erreurs GQL',
        () async {
          final req = GGetTripReq(vars: GGetTripVars(id: 99));
          when(
            () => mockClient.request(any<GGetTripReq>()),
          ).thenAnswer((_) => Stream.value(errResponse(req)));

          expect(datasource.getTripById(id: 99), throwsException);
        },
      );
    });

    // -------------------------------------------------------------------------
    // createTrip
    // -------------------------------------------------------------------------

    group('TripRemoteDatasource.createTrip', () {
      test('retourne les données du trip créé', () async {
        final input = GTripInput(title: 'Nouveau');
        final req = GCreateTripReq(vars: GCreateTripVars(trip: input));
        final gqlData = GCreateTripData(createTrip: _createResult(10));
        when(
          () => mockClient.request(any<GCreateTripReq>()),
        ).thenAnswer((_) => Stream.value(okResponse(req, gqlData)));

        final result = await datasource.createTrip(input: input);

        expect(result.id, 10);
        expect(result.title, 'Créé 10');
      });

      test('lève une Exception en cas d\'erreur GraphQL', () async {
        final input = GTripInput(title: 'Test');
        final req = GCreateTripReq(vars: GCreateTripVars(trip: input));
        when(
          () => mockClient.request(any<GCreateTripReq>()),
        ).thenAnswer((_) => Stream.value(errResponse(req)));

        expect(datasource.createTrip(input: input), throwsException);
      });
    });

    // -------------------------------------------------------------------------
    // updateTrip
    // -------------------------------------------------------------------------

    group('TripRemoteDatasource.updateTrip', () {
      test('retourne les données du trip mis à jour', () async {
        final input = GTripUpdateInput();
        final req = GUpdateTripReq(vars: GUpdateTripVars(id: 3, trip: input));
        final gqlData = GUpdateTripData(updateTrip: _updateResult(3));
        when(
          () => mockClient.request(any<GUpdateTripReq>()),
        ).thenAnswer((_) => Stream.value(okResponse(req, gqlData)));

        final result = await datasource.updateTrip(id: 3, input: input);

        expect(result.id, 3);
        expect(result.title, 'Modifié 3');
      });

      test('lève une Exception en cas d\'erreur GraphQL', () async {
        final input = GTripUpdateInput();
        final req = GUpdateTripReq(vars: GUpdateTripVars(id: 3, trip: input));
        when(
          () => mockClient.request(any<GUpdateTripReq>()),
        ).thenAnswer((_) => Stream.value(errResponse(req)));

        expect(datasource.updateTrip(id: 3, input: input), throwsException);
      });
    });

    // -------------------------------------------------------------------------
    // deleteTrip
    // -------------------------------------------------------------------------

    group('TripRemoteDatasource.deleteTrip', () {
      test('se termine normalement quand la requête réussit', () async {
        final req = GDeleteTripReq(vars: GDeleteTripVars(id: 7));
        final gqlData = GDeleteTripData(deleteTrip: true);
        when(
          () => mockClient.request(any<GDeleteTripReq>()),
        ).thenAnswer((_) => Stream.value(okResponse(req, gqlData)));

        await expectLater(datasource.deleteTrip(id: 7), completes);
      });

      test('lève une Exception en cas d\'erreur GraphQL', () async {
        final req = GDeleteTripReq(vars: GDeleteTripVars(id: 7));
        when(
          () => mockClient.request(any<GDeleteTripReq>()),
        ).thenAnswer((_) => Stream.value(errResponse(req)));

        expect(datasource.deleteTrip(id: 7), throwsException);
      });
    });

    // -------------------------------------------------------------------------
    // deleteImgTrip
    // -------------------------------------------------------------------------

    group('TripRemoteDatasource.deleteImgTrip', () {
      test('se termine normalement quand la requête réussit', () async {
        final req = GDeleteImageFromTripReq(
          vars: GDeleteImageFromTripVars(tripId: 4, fileKey: 'media/x.jpg'),
        );
        const gqlData = GDeleteImageFromTripData(deleteImageFromTrip: 'ok');
        when(
          () => mockClient.request(any<GDeleteImageFromTripReq>()),
        ).thenAnswer((_) => Stream.value(okResponse(req, gqlData)));

        await expectLater(
          datasource.deleteImgFromTrip(tripId: 4, fileKey: 'media/x.jpg'),
          completes,
        );
      });

      test('lève une Exception en cas d\'erreur GraphQL', () async {
        final req = GDeleteImageFromTripReq(
          vars: GDeleteImageFromTripVars(tripId: 4, fileKey: 'media/x.jpg'),
        );
        when(
          () => mockClient.request(any<GDeleteImageFromTripReq>()),
        ).thenAnswer((_) => Stream.value(errResponse(req)));

        expect(
          datasource.deleteImgFromTrip(tripId: 4, fileKey: 'media/x.jpg'),
          throwsException,
        );
      });
    });
  });
}
