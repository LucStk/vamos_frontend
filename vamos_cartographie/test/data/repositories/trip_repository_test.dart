import 'package:vamos_cartographie/graphql/graphql.dart';
import 'package:dartz/dartz.dart';
import 'package:latlong2/latlong.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:vamos_cartographie/core/failure.dart';
import 'package:vamos_cartographie/features/trips/data/datasources/trip_remote_datasource.dart';
import 'package:vamos_cartographie/features/trips/data/repositories/trip_repository.dart';
import 'package:vamos_cartographie/features/trips/domain/entities/entities.dart';
import 'package:vamos_cartographie/features/waypoints/domain/entities/entities.dart';

import "package:vamos_cartographie/features/segments/domain/entities/segment.dart";
import 'package:vamos_cartographie/features/media/media.dart';
// ─────────────────────────────────────────────────────────────────────────────
// Mock du datasource
// ─────────────────────────────────────────────────────────────────────────────

class MockTripRemoteDatasource extends Mock implements TripRemoteDatasource {}

class MockUploadImgRepository extends Mock implements UploadImgRepository {}

class FakeGImageFieldsData extends Fake implements GImageFieldsData {}

class FakeGTripInput extends Fake implements GTripInput {}

class FakeGTripUpdateInput extends Fake implements GTripUpdateInput {}

// ─────────────────────────────────────────────────────────────────────────────
// Helpers — données GQL minimales
// ─────────────────────────────────────────────────────────────────────────────

GImageFieldsData _img() => const GImageFieldsData(
  url: 'https://cdn/media/x.jpg',
  fileKey: 'media/x.jpg',
);

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
      id: 1,
      lat: 48.0,
      lng: 2.0,
      type: GWaypointEnum.START,
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
TripDraft _domainTrip() => TripDraft(
  title: 'Test',
  description: 'Desc',
  waypoints: [
    Waypoint(latLng: const LatLng(1, 2), type: GWaypointEnum.START),
    Waypoint(latLng: const LatLng(3, 4), type: GWaypointEnum.END),
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
    registerFallbackValue(FakeGImageFieldsData());
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
    // Par défaut, deleteImgTrip réussit silencieusement.
    when(
      () => mockDatasource.deleteImgTrip(
        tripId: any(named: 'tripId'),
        fileKey: any(named: 'fileKey'),
      ),
    ).thenAnswer((_) async {});
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
      expect(trips.first.id, 1);
      expect(trips.first.title, 'Trip 1');
      expect(trips.first.images, [
        MediaImage(fileKey: 'media/x.jpg', url: 'https://cdn/media/x.jpg'),
      ]);
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
        expect(trip.id, 5);
        expect(trip.waypoints, hasLength(1));
        expect(trip.waypoints.first.id, 1);
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
      expect(trip.id, 42);
      expect(trip.title, 'Créé 42');
    });

    test('attache les images après création', () async {
      when(
        () => mockDatasource.createTrip(input: any(named: 'input')),
      ).thenAnswer((_) async => _gqlCreate(10));

      final tripWithImages = TripDraft(
        title: 'Avec images',
        description: '',
        images: [
          MediaImage(fileKey: 'media/a.jpg', url: ""),
          MediaImage(fileKey: 'media/b.jpg', url: ""),
        ],

        waypoints: [
          Waypoint(latLng: const LatLng(1, 2), type: GWaypointEnum.START),
          Waypoint(latLng: const LatLng(3, 4), type: GWaypointEnum.END),
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

  // Helper : construit un GUpdateTripData_updateTrip avec une liste d'images.
  GUpdateTripData_updateTrip _gqlUpdateWithImages(
    int id,
    List<({String fileKey, String url})> imgs,
  ) => GUpdateTripData_updateTrip(
    id: id,
    title: 'Modifié $id',
    date: '2024-08-01',
    description: 'Mis à jour',
    images: imgs
        .map(
          (e) => GUpdateTripData_updateTrip_images(
            image: GImageFieldsData(fileKey: e.fileKey, url: e.url),
          ),
        )
        .toList(),
    waypoints: [],
    segments: [],
  );

  group('updateTrip', () {
    // ── Cas nominal ────────────────────────────────────────────────────────

    test('retourne Right(Trip) avec les métadonnées du serveur', () async {
      when(
        () => mockDatasource.updateTrip(
          id: any(named: 'id'),
          input: any(named: 'input'),
        ),
      ).thenAnswer((_) async => _gqlUpdate(7));

      final result = await repository.updateTrip(7, _domainTrip());

      expect(result.isRight(), isTrue);
      final trip = (result as Right).value as Trip;
      expect(trip.id, 7);
      expect(trip.title, 'Modifié 7');
    });

    // ── Attachement d'images ───────────────────────────────────────────────

    test(
      'attache uniquement les images nouvelles (absentes du serveur)',
      () async {
        // Le serveur retourne le trip avec 'existing.jpg' déjà attaché.
        when(
          () => mockDatasource.updateTrip(
            id: any(named: 'id'),
            input: any(named: 'input'),
          ),
        ).thenAnswer(
          (_) async => _gqlUpdateWithImages(5, [
            (fileKey: 'media/existing.jpg', url: 'https://cdn/existing.jpg'),
          ]),
        );

        final trip = Trip(
          id: 5,
          title: 'Trip',
          description: '',
          images: [
            const MediaImage(
              fileKey: 'media/existing.jpg',
              url: 'https://cdn/existing.jpg',
            ),
            const MediaImage(
              fileKey: 'media/new.jpg',
              url: 'https://cdn/new.jpg',
            ),
          ],
        );
        await repository.updateTrip(5, trip.toDraft());

        // 'existing.jpg' est déjà sur le serveur → aucun appel d'attachement.
        verifyNever(
          () => mockImageRepo.attachImageToTrip(
            tripId: 5,
            fileKey: 'media/existing.jpg',
          ),
        );
        // 'new.jpg' est nouveau → doit être attaché une seule fois.
        verify(
          () => mockImageRepo.attachImageToTrip(
            tripId: 5,
            fileKey: 'media/new.jpg',
          ),
        ).called(1);
      },
    );

    test(
      'n\'attache aucune image si toutes sont déjà sur le serveur',
      () async {
        when(
          () => mockDatasource.updateTrip(
            id: any(named: 'id'),
            input: any(named: 'input'),
          ),
        ).thenAnswer(
          (_) async => _gqlUpdateWithImages(3, [
            (fileKey: 'media/a.jpg', url: 'https://cdn/a.jpg'),
            (fileKey: 'media/b.jpg', url: 'https://cdn/b.jpg'),
          ]),
        );

        final trip = Trip(
          id: 3,
          title: 'Trip',
          description: '',
          images: [
            const MediaImage(fileKey: 'media/a.jpg', url: 'https://cdn/a.jpg'),
            const MediaImage(fileKey: 'media/b.jpg', url: 'https://cdn/b.jpg'),
          ],
        );
        await repository.updateTrip(3, trip.toDraft());

        verifyNever(
          () => mockImageRepo.attachImageToTrip(
            tripId: any(named: 'tripId'),
            fileKey: any(named: 'fileKey'),
          ),
        );
      },
    );

    // ── Suppression d'images ───────────────────────────────────────────────

    test(
      'supprime les images présentes sur le serveur mais retirées localement',
      () async {
        // Le serveur retourne 'kept.jpg' et 'removed.jpg'.
        when(
          () => mockDatasource.updateTrip(
            id: any(named: 'id'),
            input: any(named: 'input'),
          ),
        ).thenAnswer(
          (_) async => _gqlUpdateWithImages(8, [
            (fileKey: 'media/kept.jpg', url: 'https://cdn/kept.jpg'),
            (fileKey: 'media/removed.jpg', url: 'https://cdn/removed.jpg'),
          ]),
        );

        // L'utilisateur n'a gardé que 'kept.jpg'.
        final trip = Trip(
          id: 8,
          title: 'Trip',
          description: '',
          images: [
            const MediaImage(
              fileKey: 'media/kept.jpg',
              url: 'https://cdn/kept.jpg',
            ),
          ],
        );
        await repository.updateTrip(8, trip.toDraft());

        // 'removed.jpg' doit être supprimé côté serveur.
        verify(
          () => mockDatasource.deleteImgTrip(
            tripId: 8,
            fileKey: 'media/removed.jpg',
          ),
        ).called(1);
        // 'kept.jpg' ne doit pas être supprimé.
        verifyNever(
          () => mockDatasource.deleteImgTrip(
            tripId: 8,
            fileKey: 'media/kept.jpg',
          ),
        );
      },
    );

    test(
      'supprime toutes les images quand l\'utilisateur retire tout',
      () async {
        when(
          () => mockDatasource.updateTrip(
            id: any(named: 'id'),
            input: any(named: 'input'),
          ),
        ).thenAnswer(
          (_) async => _gqlUpdateWithImages(9, [
            (fileKey: 'media/a.jpg', url: 'https://cdn/a.jpg'),
            (fileKey: 'media/b.jpg', url: 'https://cdn/b.jpg'),
          ]),
        );

        // L'utilisateur a tout retiré.
        final trip = Trip(id: 9, title: 'Trip', description: '', images: []);
        await repository.updateTrip(9, trip.toDraft());

        verify(
          () => mockDatasource.deleteImgTrip(tripId: 9, fileKey: 'media/a.jpg'),
        ).called(1);
        verify(
          () => mockDatasource.deleteImgTrip(tripId: 9, fileKey: 'media/b.jpg'),
        ).called(1);
      },
    );

    test('ne supprime aucune image quand le serveur n\'en a pas', () async {
      when(
        () => mockDatasource.updateTrip(
          id: any(named: 'id'),
          input: any(named: 'input'),
        ),
      ).thenAnswer((_) async => _gqlUpdateWithImages(2, []));

      final trip = Trip(id: 2, title: 'Trip', description: '', images: []);
      await repository.updateTrip(2, trip.toDraft());

      verifyNever(
        () => mockDatasource.deleteImgTrip(
          tripId: any(named: 'tripId'),
          fileKey: any(named: 'fileKey'),
        ),
      );
    });

    // ── Liste finale retournée ─────────────────────────────────────────────

    test(
      'la liste d\'images retournée contient les images conservées + la nouvelle',
      () async {
        // Serveur : 'kept.jpg' + 'removed.jpg'.
        when(
          () => mockDatasource.updateTrip(
            id: any(named: 'id'),
            input: any(named: 'input'),
          ),
        ).thenAnswer(
          (_) async => _gqlUpdateWithImages(6, [
            (fileKey: 'media/kept.jpg', url: 'https://cdn/kept.jpg'),
            (fileKey: 'media/removed.jpg', url: 'https://cdn/removed.jpg'),
          ]),
        );

        // Utilisateur : garde 'kept.jpg', retire 'removed.jpg', ajoute 'new.jpg'.
        final trip = Trip(
          id: 6,
          title: 'Trip',
          description: '',
          images: [
            const MediaImage(
              fileKey: 'media/kept.jpg',
              url: 'https://cdn/kept.jpg',
            ),
            const MediaImage(
              fileKey: 'media/new.jpg',
              url: 'https://cdn/new.jpg',
            ),
          ],
        );
        final result = await repository.updateTrip(6, trip.toDraft());

        expect(result.isRight(), isTrue);
        final returned = (result as Right).value as Trip;
        final fileKeys = returned.images.map((i) => i.fileKey).toList();

        // 'kept.jpg' et 'new.jpg' doivent être présents.
        expect(fileKeys, containsAll(['media/kept.jpg', 'media/new.jpg']));
        // 'removed.jpg' ne doit plus apparaître.
        expect(fileKeys, isNot(contains('media/removed.jpg')));
      },
    );

    // ── Erreur réseau ──────────────────────────────────────────────────────

    test(
      'retourne Left(ServerFailure) quand le datasource lève une exception',
      () async {
        when(
          () => mockDatasource.updateTrip(
            id: any(named: 'id'),
            input: any(named: 'input'),
          ),
        ).thenThrow(Exception('Erreur mise à jour'));

        final result = await repository.updateTrip(7, _domainTrip());

        expect(result.isLeft(), isTrue);
        expect((result as Left).value, isA<ServerFailure>());
      },
    );
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
