import 'package:api_client/api_client.dart';
import 'package:dartz/dartz.dart';
import 'package:latlong2/latlong.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:vamos_cartographie/core/failure.dart';
import 'package:vamos_cartographie/data/datasources/trip_remote_datasource.dart';
import 'package:vamos_cartographie/data/repositories/trip_repository.dart';
import 'package:vamos_cartographie/data/repositories/upload_img_repository.dart';
import 'package:vamos_cartographie/domain/models.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Mock du datasource
// ─────────────────────────────────────────────────────────────────────────────

class MockTripRemoteDatasource extends Mock implements TripRemoteDatasource {}

class MockUploadImgRepository extends Mock implements UploadImgRepository {}

class FakeGTripInput extends Fake implements GTripInput {}

class FakeGTripUpdateInput extends Fake implements GTripUpdateInput {}

// ─────────────────────────────────────────────────────────────────────────────
// Helpers — données GQL minimales
// ─────────────────────────────────────────────────────────────────────────────

GImageFieldsData _img() =>
    const GImageFieldsData(url: 'https://cdn/x.jpg', fileKey: 'media/x.jpg');

GTripFieldsData _gqlFields(int id) => GTripFieldsData(
  id: id,
  title: 'Trip $id',
  date: '2024-03-10',
  description: 'Description $id',
  images: [GTripFieldsData_images(image: _img())],
);

GGetTripData_trip _gqlDetail(int id) => GGetTripData_trip(
  id: id,
  title: 'Trip $id',
  date: '2024-03-10',
  description: 'Description $id',
  images: [GGetTripData_trip_images(image: _img())],
  waypoints: [
    GWaypointFieldsData(
      id: 'wp-$id',
      lat: 48.0,
      lng: 2.0,
      type: GWaypointTypeEnum.start,
      title: 'Départ',
      description: 'Point de départ',
      images: [],
    ),
  ],
  segments: [],
);

GCreateTripData_createTrip _gqlCreate(int id) => GCreateTripData_createTrip(
  id: id,
  title: 'Créé $id',
  date: null,
  description: 'Desc',
  images: [],
  waypoints: [],
  segments: [],
);

GUpdateTripData_updateTrip _gqlUpdate(int id) => GUpdateTripData_updateTrip(
  id: id,
  title: 'Modifié $id',
  date: '2024-08-01',
  description: 'Mis à jour',
  images: [],
  waypoints: [],
  segments: [],
);

/// Trip domaine minimal pour les appels de mutation.
Trip _domainTrip({String? id}) => Trip(
  id: id,
  title: 'Test',
  description: 'Desc',
  waypoints: [
    Waypoint(latLng: const LatLng(1, 2), type: GWaypointTypeEnum.start),
    Waypoint(latLng: const LatLng(3, 4), type: GWaypointTypeEnum.end),
  ],
  segments: [Segment(type: GSegmentTypeEnum.bike)],
);

// ─────────────────────────────────────────────────────────────────────────────
// Tests
// ─────────────────────────────────────────────────────────────────────────────

void main() {
  late MockTripRemoteDatasource mockDatasource;
  late MockUploadImgRepository mockImageRepo;
  late TripRepository repository;

  setUpAll(() {
    registerFallbackValue(FakeGTripInput());
    registerFallbackValue(FakeGTripUpdateInput());
  });

  setUp(() {
    mockDatasource = MockTripRemoteDatasource();
    mockImageRepo = MockUploadImgRepository();
    // Par défaut, attachImageToTrip réussit silencieusement.
    when(
      () => mockImageRepo.attachImageToTrip(
        tripId: any(named: 'tripId'),
        fileKey: any(named: 'fileKey'),
      ),
    ).thenAnswer((_) async => const Right(null));
    repository = TripRepository(mockDatasource, mockImageRepo);
  });

  // ---------------------------------------------------------------------------
  // getAllTrips
  // ---------------------------------------------------------------------------

  group('getAllTrips', () {
    test('retourne Right(List<Trip>) quand le datasource réussit', () async {
      when(
        () => mockDatasource.getAllTrips(),
      ).thenAnswer((_) async => [_gqlFields(1), _gqlFields(2)]);

      final result = await repository.getAllTrips();

      expect(result.isRight(), isTrue);
      final trips = (result as Right).value as List<Trip>;
      expect(trips, hasLength(2));
      expect(trips.first.id, '1');
      expect(trips.first.title, 'Trip 1');
      expect(trips.first.images, ['media/x.jpg']);
    });

    test('retourne Right([]) pour une liste vide', () async {
      when(() => mockDatasource.getAllTrips()).thenAnswer((_) async => []);

      final result = await repository.getAllTrips();

      expect(result.isRight(), isTrue);
      expect((result as Right).value, isEmpty);
    });

    test(
      'retourne Left(ServerFailure) quand le datasource lève une Exception',
      () async {
        when(
          () => mockDatasource.getAllTrips(),
        ).thenThrow(Exception('Réseau indisponible'));

        final result = await repository.getAllTrips();

        expect(result.isLeft(), isTrue);
        expect((result as Left).value, isA<ServerFailure>());
      },
    );
  });

  // ---------------------------------------------------------------------------
  // getTrip
  // ---------------------------------------------------------------------------

  group('getTrip', () {
    test(
      'retourne Right(Trip) avec waypoints quand le datasource réussit',
      () async {
        when(
          () => mockDatasource.getTripById(id: 5),
        ).thenAnswer((_) async => _gqlDetail(5));

        final result = await repository.getTrip(5);

        expect(result.isRight(), isTrue);
        final trip = (result as Right).value as Trip;
        expect(trip.id, '5');
        expect(trip.waypoints, hasLength(1));
        expect(trip.waypoints.first.id, 'wp-5');
      },
    );

    test(
      'retourne Left(ServerFailure) quand le datasource lève une Exception',
      () async {
        when(
          () => mockDatasource.getTripById(id: any(named: 'id')),
        ).thenThrow(Exception('Trip introuvable (id: 99)'));

        final result = await repository.getTrip(99);

        expect(result.isLeft(), isTrue);
        expect((result as Left).value, isA<ServerFailure>());
      },
    );
  });

  // ---------------------------------------------------------------------------
  // createTrip
  // ---------------------------------------------------------------------------

  group('createTrip', () {
    test('retourne Right(Trip) avec l\'id assigné par le serveur', () async {
      when(
        () => mockDatasource.createTrip(input: any(named: 'input')),
      ).thenAnswer((_) async => _gqlCreate(42));

      final result = await repository.createTrip(_domainTrip());

      expect(result.isRight(), isTrue);
      final trip = (result as Right).value as Trip;
      expect(trip.id, '42');
      expect(trip.title, 'Créé 42');
    });

    test('attache les images après création', () async {
      when(
        () => mockDatasource.createTrip(input: any(named: 'input')),
      ).thenAnswer((_) async => _gqlCreate(10));

      final tripWithImages = Trip(
        title: 'Avec images',
        description: '',
        images: ['media/a.jpg', 'media/b.jpg'],
        waypoints: [
          Waypoint(latLng: const LatLng(1, 2), type: GWaypointTypeEnum.start),
          Waypoint(latLng: const LatLng(3, 4), type: GWaypointTypeEnum.end),
        ],
        segments: [Segment(type: GSegmentTypeEnum.bike)],
      );
      final result = await repository.createTrip(tripWithImages);

      expect(result.isRight(), isTrue);
      // Vérifie que attachImageToTrip a été appelé pour chaque image.
      verify(
        () =>
            mockImageRepo.attachImageToTrip(tripId: 10, fileKey: 'media/a.jpg'),
      ).called(1);
      verify(
        () =>
            mockImageRepo.attachImageToTrip(tripId: 10, fileKey: 'media/b.jpg'),
      ).called(1);
    });

    test('retourne Left(ServerFailure) en cas d\'exception', () async {
      when(
        () => mockDatasource.createTrip(input: any(named: 'input')),
      ).thenThrow(Exception('Erreur création'));

      final result = await repository.createTrip(_domainTrip());

      expect(result.isLeft(), isTrue);
      expect((result as Left).value, isA<ServerFailure>());
    });
  });

  // ---------------------------------------------------------------------------
  // updateTrip
  // ---------------------------------------------------------------------------

  group('updateTrip', () {
    test('retourne Right(Trip) après une mise à jour réussie', () async {
      when(
        () => mockDatasource.updateTrip(
          id: any(named: 'id'),
          input: any(named: 'input'),
        ),
      ).thenAnswer((_) async => _gqlUpdate(7));

      final result = await repository.updateTrip(7, _domainTrip(id: '7'));

      expect(result.isRight(), isTrue);
      final trip = (result as Right).value as Trip;
      expect(trip.id, '7');
      expect(trip.title, 'Modifié 7');
    });

    test(
      'n\'attache que les images nouvelles (pas celles déjà sur le serveur)',
      () async {
        // Le serveur retourne le trip avec 'media/existing.jpg' déjà attaché.
        final updateResult = GUpdateTripData_updateTrip(
          id: 5,
          title: 'Trip',
          date: null,
          description: '',
          images: [
            GUpdateTripData_updateTrip_images(
              image: const GImageFieldsData(
                url: 'https://cdn/existing.jpg',
                fileKey: 'media/existing.jpg',
              ),
            ),
          ],
          waypoints: [],
          segments: [],
        );
        when(
          () => mockDatasource.updateTrip(
            id: any(named: 'id'),
            input: any(named: 'input'),
          ),
        ).thenAnswer((_) async => updateResult);

        final tripWithImages = Trip(
          id: '5',
          title: 'Trip',
          description: '',
          images: ['media/existing.jpg', 'media/new.jpg'],
        );
        await repository.updateTrip(5, tripWithImages);

        // 'media/existing.jpg' est déjà attaché → pas de nouvel appel.
        verifyNever(
          () => mockImageRepo.attachImageToTrip(
            tripId: 5,
            fileKey: 'media/existing.jpg',
          ),
        );
        // 'media/new.jpg' est nouveau → doit être attaché.
        verify(
          () => mockImageRepo.attachImageToTrip(
            tripId: 5,
            fileKey: 'media/new.jpg',
          ),
        ).called(1);
      },
    );

    test('retourne Left(ServerFailure) en cas d\'exception', () async {
      when(
        () => mockDatasource.updateTrip(
          id: any(named: 'id'),
          input: any(named: 'input'),
        ),
      ).thenThrow(Exception('Erreur mise à jour'));

      final result = await repository.updateTrip(7, _domainTrip(id: '7'));

      expect(result.isLeft(), isTrue);
      expect((result as Left).value, isA<ServerFailure>());
    });
  });

  // ---------------------------------------------------------------------------
  // deleteTrip
  // ---------------------------------------------------------------------------

  group('deleteTrip', () {
    test('retourne Right(null) quand la suppression réussit', () async {
      when(
        () => mockDatasource.deleteTrip(id: any(named: 'id')),
      ).thenAnswer((_) async {});

      final result = await repository.deleteTrip(3);

      expect(result.isRight(), isTrue);
    });

    test('retourne Left(ServerFailure) en cas d\'exception', () async {
      when(
        () => mockDatasource.deleteTrip(id: any(named: 'id')),
      ).thenThrow(Exception('Erreur suppression'));

      final result = await repository.deleteTrip(3);

      expect(result.isLeft(), isTrue);
      expect((result as Left).value, isA<ServerFailure>());
    });
  });
}
