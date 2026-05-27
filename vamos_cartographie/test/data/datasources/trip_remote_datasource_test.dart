import 'package:vamos_cartographie/graphql/graphql.dart';
import 'package:ferry/ferry.dart';
import 'package:gql_exec/gql_exec.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:vamos_cartographie/features/trips/data/datasources/trip_remote_datasource.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Mocks & Fakes
// ─────────────────────────────────────────────────────────────────────────────

class MockFerryClient extends Mock implements Client {}

class FakeGetAllTripsReq extends Fake implements GGetAllTripsReq {}

class FakeGetTripReq extends Fake implements GGetTripReq {}

class FakeCreateTripReq extends Fake implements GCreateTripReq {}

class FakeUpdateTripReq extends Fake implements GUpdateTripReq {}

class FakeDeleteTripReq extends Fake implements GDeleteTripReq {}

class FakeDeleteImageFromTripReq extends Fake
    implements GDeleteImageFromTripReq {}

// ─────────────────────────────────────────────────────────────────────────────
// Helpers réponse Ferry
// ─────────────────────────────────────────────────────────────────────────────

/// Réponse succès : passe la requête en [operationRequest] pour éviter
/// le cast null → type non-nullable dans [OperationResponse].
OperationResponse<TData, TVars> _ok<TData, TVars>(
  OperationRequest<TData, TVars> req,
  TData data,
) => OperationResponse<TData, TVars>(
  operationRequest: req,
  data: data,
  graphqlErrors: null,
  linkException: null,
  dataSource: DataSource.None,
);

/// Réponse en erreur GraphQL.
OperationResponse<TData, TVars> _err<TData, TVars>(
  OperationRequest<TData, TVars> req,
) => OperationResponse<TData, TVars>(
  operationRequest: req,
  data: null,
  graphqlErrors: [const GraphQLError(message: 'Erreur serveur')],
  linkException: null,
  dataSource: DataSource.None,
);

// ─────────────────────────────────────────────────────────────────────────────
// Helpers données GQL
// ─────────────────────────────────────────────────────────────────────────────

GImageFieldsData _img() =>
    const GImageFieldsData(url: 'https://cdn/x.jpg', fileKey: 'media/x.jpg');

GTripFieldsData _tripFields(int id) => GTripFieldsData(
  id: id,
  title: 'Trip $id',
  date: '2024-01-01',
  description: 'Desc $id',
  images: [GTripFieldsData_images(image: _img())],
);

GGetTripData_trip _tripDetail(int id) => GGetTripData_trip(
  id: id,
  title: 'Trip $id',
  date: '2024-01-01',
  description: 'Desc $id',
  images: [GGetTripData_trip_images(image: _img())],
  waypoints: [],
  segments: [],
);

GCreateTripData_createTrip _createResult(int id) => GCreateTripData_createTrip(
  id: id,
  title: 'Créé $id',
  date: null,
  description: 'Desc',
  images: [],
  waypoints: [],
  segments: [],
);

GUpdateTripData_updateTrip _updateResult(int id) => GUpdateTripData_updateTrip(
  id: id,
  title: 'Modifié $id',
  date: null,
  description: 'Desc',
  images: [],
  waypoints: [],
  segments: [],
);

GDeleteTripData_deleteTrip _deleteResult(int id) =>
    GDeleteTripData_deleteTrip(id: id);

// ─────────────────────────────────────────────────────────────────────────────
// Tests
// ─────────────────────────────────────────────────────────────────────────────

void main() {
  late MockFerryClient mockClient;

  setUpAll(() {
    registerFallbackValue(FakeGetAllTripsReq());
    registerFallbackValue(FakeGetTripReq());
    registerFallbackValue(FakeCreateTripReq());
    registerFallbackValue(FakeUpdateTripReq());
    registerFallbackValue(FakeDeleteTripReq());
    registerFallbackValue(FakeDeleteImageFromTripReq());
  });

  setUp(() {
    mockClient = MockFerryClient();
  });

  // ===========================================================================
  // Groupe 1 : TripRemoteDatasource
  // ===========================================================================

  group('TripRemoteDatasource', () {
    late TripRemoteDatasource datasource;

    setUp(() {
      datasource = TripRemoteDatasource(mockClient);
    });

    // -------------------------------------------------------------------------
    // getAllTrips
    // -------------------------------------------------------------------------

    group('getAllTrips', () {
      test('retourne la liste quand la requête réussit', () async {
        final req = GGetAllTripsReq();
        final gqlData = GGetAllTripsData(
          trips: [_tripFields(1), _tripFields(2)],
        );
        when(
          () => mockClient.request(any<GGetAllTripsReq>()),
        ).thenAnswer((_) => Stream.value(_ok(req, gqlData)));

        final result = await datasource.getAllTrips();

        expect(result, hasLength(2));
        expect(result.first.id, 1);
        expect(result.first.title, 'Trip 1');
      });

      test(
        'lève une Exception si la réponse contient des erreurs GQL',
        () async {
          final req = GGetAllTripsReq();
          when(
            () => mockClient.request(any<GGetAllTripsReq>()),
          ).thenAnswer((_) => Stream.value(_err(req)));

          expect(datasource.getAllTrips(), throwsException);
        },
      );

      test('lève une Exception si data est null', () async {
        final req = GGetAllTripsReq();
        when(() => mockClient.request(any<GGetAllTripsReq>())).thenAnswer(
          (_) => Stream.value(
            OperationResponse<GGetAllTripsData, Null>(
              operationRequest: req,
              data: null,
              graphqlErrors: null,
              linkException: null,
              dataSource: DataSource.None,
            ),
          ),
        );

        expect(datasource.getAllTrips(), throwsException);
      });
    });

    // -------------------------------------------------------------------------
    // getTripById
    // -------------------------------------------------------------------------

    group('getTripById', () {
      test('retourne le trip quand la requête réussit', () async {
        final req = GGetTripReq(vars: GGetTripVars(id: 5));
        final gqlData = GGetTripData(trip: _tripDetail(5));
        when(
          () => mockClient.request(any<GGetTripReq>()),
        ).thenAnswer((_) => Stream.value(_ok(req, gqlData)));

        final result = await datasource.getTripById(id: 5);

        expect(result.id, 5);
        expect(result.title, 'Trip 5');
        expect(result.images, hasLength(1));
      });

      test(
        'lève une Exception si la réponse contient des erreurs GQL',
        () async {
          final req = GGetTripReq(vars: GGetTripVars(id: 99));
          when(
            () => mockClient.request(any<GGetTripReq>()),
          ).thenAnswer((_) => Stream.value(_err(req)));

          expect(datasource.getTripById(id: 99), throwsException);
        },
      );
    });

    // -------------------------------------------------------------------------
    // createTrip
    // -------------------------------------------------------------------------

    group('createTrip', () {
      test('retourne les données du trip créé', () async {
        final input = GTripInput(title: 'Nouveau');
        final req = GCreateTripReq(vars: GCreateTripVars(trip: input));
        final gqlData = GCreateTripData(createTrip: _createResult(10));
        when(
          () => mockClient.request(any<GCreateTripReq>()),
        ).thenAnswer((_) => Stream.value(_ok(req, gqlData)));

        final result = await datasource.createTrip(input: input);

        expect(result.id, 10);
        expect(result.title, 'Créé 10');
      });

      test("lève une Exception en cas d'erreur GraphQL", () async {
        final input = GTripInput(title: 'Test');
        final req = GCreateTripReq(vars: GCreateTripVars(trip: input));
        when(
          () => mockClient.request(any<GCreateTripReq>()),
        ).thenAnswer((_) => Stream.value(_err(req)));

        expect(datasource.createTrip(input: input), throwsException);
      });
    });

    // -------------------------------------------------------------------------
    // updateTrip
    // -------------------------------------------------------------------------

    group('updateTrip', () {
      test('retourne les données du trip mis à jour', () async {
        final input = GTripUpdateInput();
        final req = GUpdateTripReq(vars: GUpdateTripVars(id: 3, trip: input));
        final gqlData = GUpdateTripData(updateTrip: _updateResult(3));
        when(
          () => mockClient.request(any<GUpdateTripReq>()),
        ).thenAnswer((_) => Stream.value(_ok(req, gqlData)));

        final result = await datasource.updateTrip(id: 3, input: input);

        expect(result.id, 3);
        expect(result.title, 'Modifié 3');
      });

      test("lève une Exception en cas d'erreur GraphQL", () async {
        final input = GTripUpdateInput();
        final req = GUpdateTripReq(vars: GUpdateTripVars(id: 3, trip: input));
        when(
          () => mockClient.request(any<GUpdateTripReq>()),
        ).thenAnswer((_) => Stream.value(_err(req)));

        expect(datasource.updateTrip(id: 3, input: input), throwsException);
      });
    });

    // -------------------------------------------------------------------------
    // deleteTrip
    // -------------------------------------------------------------------------

    group('deleteTrip', () {
      test('se termine normalement quand la requête réussit', () async {
        final req = GDeleteTripReq(vars: GDeleteTripVars(id: 7));
        final gqlData = GDeleteTripData(deleteTrip: _deleteResult(7));
        when(
          () => mockClient.request(any<GDeleteTripReq>()),
        ).thenAnswer((_) => Stream.value(_ok(req, gqlData)));

        await expectLater(datasource.deleteTrip(id: 7), completes);
      });

      test("lève une Exception en cas d'erreur GraphQL", () async {
        final req = GDeleteTripReq(vars: GDeleteTripVars(id: 7));
        when(
          () => mockClient.request(any<GDeleteTripReq>()),
        ).thenAnswer((_) => Stream.value(_err(req)));

        expect(datasource.deleteTrip(id: 7), throwsException);
      });
    });

    // -------------------------------------------------------------------------
    // deleteImgTrip
    // -------------------------------------------------------------------------

    group('deleteImgTrip', () {
      test('se termine normalement quand la requête réussit', () async {
        final req = GDeleteImageFromTripReq(
          vars: GDeleteImageFromTripVars(tripId: 4, fileKey: 'media/x.jpg'),
        );
        final gqlData = const GDeleteImageFromTripData(
          deleteImageFromTrip: 'ok',
        );
        when(
          () => mockClient.request(any<GDeleteImageFromTripReq>()),
        ).thenAnswer((_) => Stream.value(_ok(req, gqlData)));

        await expectLater(
          datasource.deleteImgTrip(tripId: 4, fileKey: 'media/x.jpg'),
          completes,
        );
      });

      test("lève une Exception en cas d'erreur GraphQL", () async {
        final req = GDeleteImageFromTripReq(
          vars: GDeleteImageFromTripVars(tripId: 4, fileKey: 'media/x.jpg'),
        );
        when(
          () => mockClient.request(any<GDeleteImageFromTripReq>()),
        ).thenAnswer((_) => Stream.value(_err(req)));

        expect(
          datasource.deleteImgTrip(tripId: 4, fileKey: 'media/x.jpg'),
          throwsException,
        );
      });
    });
  });
}
