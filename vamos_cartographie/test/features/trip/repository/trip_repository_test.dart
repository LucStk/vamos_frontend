import 'package:dartz/dartz.dart';
import 'package:latlong2/latlong.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:vamos_cartographie/core/failure.dart';
import 'package:vamos_cartographie/features/media/domain/entities/entities.dart';
import 'package:vamos_cartographie/features/trips/data/repositories/trip_repository.dart';
import 'package:vamos_cartographie/features/trips/domain/entities/entities.dart';
import 'package:vamos_cartographie/features/waypoints/domain/entities/entities.dart';
import 'package:vamos_cartographie/features/segments/domain/entities/segment.dart';
import 'package:vamos_cartographie/graphql/graphql.dart';

import '../../../fixtures/mock_classes.dart';
import '../../../fixtures/trip_fixtures.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Helpers locaux
// ─────────────────────────────────────────────────────────────────────────────

/// Construit un GUpdateTripData_updateTrip (GTripFieldsData) avec des images.
GTripFieldsData _gqlUpdateWithImages(
  int id,
  List<({String fileKey, String url})> imgs,
) => GTripFieldsData(
  id: id,
  title: 'Modifié $id',
  date: '2024-08-01',
  description: 'Mis à jour',
  images: imgs
      .map(
        (e) => GTripFieldsData_images(
          image: GImageFieldsData(fileKey: e.fileKey, url: e.url),
        ),
      )
      .toList(),
);

/// TripDraft minimal pour les appels de mutation.
TripDraft _domainTrip() => TripDraft(
  title: 'Test',
  description: 'Desc',
  waypoints: [
    Waypoint(id: 1, latLng: const LatLng(1, 2), type: GWaypointEnum.START),
    Waypoint(id: 2, latLng: const LatLng(3, 4), type: GWaypointEnum.END),
  ],
  segments: [
    Segment(
      id: 1,
      type: GSegmentTypeEnum.bike,
      startWaypointId: 1,
      endWaypointId: 2,
    ),
  ],
);

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

    // Par défaut : attachImageToTrip réussit silencieusement.
    when(
      () => mockDatasource.attachImageToTrip(
        tripId: any(named: 'tripId'),
        fileKey: any(named: 'fileKey'),
      ),
    ).thenAnswer((_) async => const Right(null));

    // Par défaut : deleteImgTrip réussit silencieusement.
    when(
      () => mockDatasource.deleteImgFromTrip(
        tripId: any(named: 'tripId'),
        fileKey: any(named: 'fileKey'),
      ),
    ).thenAnswer((_) async {});

    repository = TripRepository(mockDatasource);
  });

  // ---------------------------------------------------------------------------
  // getAllTrips
  // ---------------------------------------------------------------------------

  group('TripRepository.getAllTrips', () {
    test('retourne Right(List<Trip>) quand le datasource réussit', () async {
      when(() => mockDatasource.getAllTrips()).thenAnswer(
        (_) async => [gTripFieldsData(id: 1), gTripFieldsData(id: 2)],
      );

      final result = await repository.getAllTrips();

      expect(result.isRight(), isTrue);
      final trips = (result as Right).value as List<Trip>;
      expect(trips, hasLength(2));
      expect(trips.first.id, 1);
      expect(trips.first.images, hasLength(1));
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

  group('TripRepository.getTrip', () {
    test(
      'retourne Right(Trip) avec waypoints quand le datasource réussit',
      () async {
        when(
          () => mockDatasource.getTripById(id: 5),
        ).thenAnswer((_) async => gTripDetailData(id: 5));

        final result = await repository.getTrip(5);

        expect(result.isRight(), isTrue);
        final trip = (result as Right).value as Trip;
        expect(trip.id, 5);
        expect(trip.waypoints, hasLength(2));
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

  group('TripRepository.createTrip', () {
    test('retourne Right(Trip) avec l\'id assigné par le serveur', () async {
      when(
        () => mockDatasource.createTrip(input: any(named: 'input')),
      ).thenAnswer(
        (_) async => GTripFieldsData(
          id: 42,
          title: 'Créé 42',
          description: 'Desc',
          images: [],
        ),
      );

      final result = await repository.createTrip(_domainTrip());

      expect(result.isRight(), isTrue);
      final trip = (result as Right).value as Trip;
      expect(trip.id, 42);
      expect(trip.title, 'Créé 42');
    });

    test('attache les images après création', () async {
      when(
        () => mockDatasource.createTrip(input: any(named: 'input')),
      ).thenAnswer(
        (_) async => GTripFieldsData(
          id: 10,
          title: 'Avec images',
          description: '',
          images: [],
        ),
      );

      final tripWithImages = TripDraft(
        title: 'Avec images',
        description: '',
        images: [
          const MediaImage(fileKey: 'media/a.jpg', url: ''),
          const MediaImage(fileKey: 'media/b.jpg', url: ''),
        ],
      );
      final result = await repository.createTrip(tripWithImages);

      expect(result.isRight(), isTrue);
      verify(
        () => mockDatasource.attachImageToTrip(
          tripId: 10,
          fileKey: 'media/a.jpg',
        ),
      ).called(1);
      verify(
        () => mockDatasource.attachImageToTrip(
          tripId: 10,
          fileKey: 'media/b.jpg',
        ),
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

  group('TripRepository.updateTrip', () {
    test('retourne Right(Trip) avec les métadonnées du serveur', () async {
      when(
        () => mockDatasource.updateTrip(
          id: any(named: 'id'),
          input: any(named: 'input'),
        ),
      ).thenAnswer(
        (_) async => GTripFieldsData(
          id: 7,
          title: 'Modifié 7',
          description: 'Mis à jour',
          images: [],
        ),
      );

      final result = await repository.updateTrip(7, _domainTrip());

      expect(result.isRight(), isTrue);
      final trip = (result as Right).value as Trip;
      expect(trip.id, 7);
      expect(trip.title, 'Modifié 7');
    });

    test(
      'attache uniquement les images nouvelles (absentes du serveur)',
      () async {
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

        // 'existing.jpg' est déjà sur le serveur → pas d'attachement.
        verifyNever(
          () => mockDatasource.attachImageToTrip(
            tripId: 5,
            fileKey: 'media/existing.jpg',
          ),
        );
        // 'new.jpg' est nouveau → doit être attaché une seule fois.
        verify(
          () => mockDatasource.attachImageToTrip(
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
          () => mockDatasource.attachImageToTrip(
            tripId: any(named: 'tripId'),
            fileKey: any(named: 'fileKey'),
          ),
        );
      },
    );

    test(
      'supprime les images présentes sur le serveur mais retirées localement',
      () async {
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

        verify(
          () => mockDatasource.deleteImgFromTrip(
            tripId: 8,
            fileKey: 'media/removed.jpg',
          ),
        ).called(1);
        verifyNever(
          () => mockDatasource.deleteImgFromTrip(
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

        final trip = Trip(id: 9, title: 'Trip', description: '', images: []);
        await repository.updateTrip(9, trip.toDraft());

        verify(
          () => mockDatasource.deleteImgFromTrip(
            tripId: 9,
            fileKey: 'media/a.jpg',
          ),
        ).called(1);
        verify(
          () => mockDatasource.deleteImgFromTrip(
            tripId: 9,
            fileKey: 'media/b.jpg',
          ),
        ).called(1);
      },
    );

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

  group('TripRepository.deleteTrip', () {
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
