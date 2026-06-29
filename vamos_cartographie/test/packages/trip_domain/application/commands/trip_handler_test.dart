import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:domain_core/domain_core.dart';
import 'package:domain_core/optimitic_executor.dart';
import 'package:trip_domain/trip_domain.dart';

// ---------------------------------------------------------------------------
// Mocks
// ---------------------------------------------------------------------------

class MockTripRepository extends Mock implements TripRepository {}

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

Trip makeTrip({int id = 1, String title = 'Voyage'}) =>
    Trip(id: Id<Trip>(id), title: title);

void main() {
  late MockTripRepository mockRepo;
  late ObservableTripStore tripStore;
  late ObservableMediaStore mediaStore;
  late OptimisticExecutor executor;
  late TripHandler handler;

  setUpAll(() {
    registerFallbackValue(makeTrip());
    registerFallbackValue(Id<Trip>(0));
  });

  setUp(() {
    mockRepo = MockTripRepository();
    tripStore = ObservableTripStore();
    mediaStore = ObservableMediaStore();
    executor = OptimisticExecutor();
    handler = TripHandler(tripStore, mediaStore, mockRepo, executor);
  });

  // -------------------------------------------------------------------------
  // loadFromRemote
  // -------------------------------------------------------------------------

  group('TripHandler.loadFromRemote', () {
    test('vide les stores puis upsert les trips retournés', () async {
      // arrange
      tripStore.upsert(makeTrip(id: 99, title: 'Ancien'));
      final List<(Trip, List<MediaImage>)> remoteTrips = [
        (makeTrip(id: 1), []),
        (makeTrip(id: 2), []),
      ];
      when(
        () => mockRepo.getAllTrips(),
      ).thenAnswer((_) async => Right(remoteTrips));

      // act — loadFromRemote retourne maintenant Future<Either<Failure,void>>
      await handler.loadFromRemote();

      // assert
      expect(tripStore.get(Id<Trip>(99)), isNull);
      expect(tripStore.get(Id<Trip>(1)), equals(remoteTrips[0]));
      expect(tripStore.get(Id<Trip>(2)), equals(remoteTrips[1]));
    });

    test('vide le tripStore au début du chargement', () async {
      // arrange
      tripStore.upsert(makeTrip(id: 99, title: 'Ancien'));
      when(
        () => mockRepo.getAllTrips(),
      ).thenAnswer((_) async => const Right([]));

      // act
      await handler.loadFromRemote();

      // assert
      expect(tripStore.get(Id<Trip>(99)), isNull);
    });

    test('retourne Right(null) en cas de succès', () async {
      // arrange
      when(
        () => mockRepo.getAllTrips(),
      ).thenAnswer((_) async => const Right([]));

      // act
      final result = await handler.loadFromRemote();

      // assert
      expect(result.isRight(), true);
    });

    test('retourne Left(failure) si le repository échoue', () async {
      // arrange
      when(
        () => mockRepo.getAllTrips(),
      ).thenAnswer((_) async => Left(ServerFailure('erreur réseau')));

      // act
      final result = await handler.loadFromRemote();

      // assert
      expect(result.isLeft(), true);
    });

    test('vide le mediaStore avant de charger', () async {
      // arrange
      when(
        () => mockRepo.getAllTrips(),
      ).thenAnswer((_) async => const Right([]));
      bool mediaStoreClearCalled = false;
      mediaStore.addListener(() => mediaStoreClearCalled = true);

      // act
      await handler.loadFromRemote();

      // assert
      expect(mediaStoreClearCalled, true);
    });
  });

  // -------------------------------------------------------------------------
  // createBlankTrip
  // -------------------------------------------------------------------------

  group('TripHandler.createBlankTrip', () {
    test('retourne le trip créé et l\'ajoute au store', () async {
      // arrange
      final newTrip = makeTrip(id: 10, title: 'Nouveau');
      when(
        () => mockRepo.createBlankTrip(),
      ).thenAnswer((_) async => Right(newTrip));

      // act
      final result = await handler.createBlankTrip();

      // assert
      expect(result, equals(newTrip));
      expect(tripStore.get(newTrip.id), equals(newTrip));
    });

    test('lève une exception si le repository retourne une Failure', () async {
      // arrange
      when(
        () => mockRepo.createBlankTrip(),
      ).thenAnswer((_) async => Left(ServerFailure('création échouée')));

      // assert
      await expectLater(handler.createBlankTrip(), throwsException);
    });
  });

  // -------------------------------------------------------------------------
  // updateTrip
  // -------------------------------------------------------------------------

  group('TripHandler.updateTrip', () {
    test(
      'met à jour le store optimistiquement puis avec la réponse serveur',
      () async {
        // arrange
        final original = makeTrip(id: 1, title: 'Original');
        final updated = makeTrip(id: 1, title: 'Modifié');
        final serverTrip = makeTrip(id: 1, title: 'Serveur');
        tripStore.upsert(original);
        when(
          () => mockRepo.updateTrip(any()),
        ).thenAnswer((_) async => Right(serverTrip));

        // act
        await handler.updateTrip(updated);

        // assert — la valeur finale est celle retournée par le serveur
        expect(tripStore.get(Id<Trip>(1))!.title, equals('Serveur'));
      },
    );

    test(
      'rollback vers l\'ancienne valeur si le repository retourne une Failure',
      () async {
        // arrange
        final original = makeTrip(id: 1, title: 'Original');
        final updated = makeTrip(id: 1, title: 'Modifié');
        tripStore.upsert(original);
        when(
          () => mockRepo.updateTrip(any()),
        ).thenAnswer((_) async => Left(ServerFailure('erreur')));

        // act
        await handler.updateTrip(updated);

        // assert — le store revient à l'ancienne valeur
        expect(tripStore.get(Id<Trip>(1))!.title, equals('Original'));
      },
    );

    test(
      'lève une exception si l\'id du trip n\'existe pas dans le store',
      () async {
        // arrange — le store est vide
        final trip = makeTrip(id: 42);

        // assert
        expect(() => handler.updateTrip(trip), throwsException);
      },
    );
  });

  // -------------------------------------------------------------------------
  // deleteTrip
  // -------------------------------------------------------------------------

  group('TripHandler.deleteTrip', () {
    test('retire le trip du store de manière optimiste', () async {
      // arrange
      final trip = makeTrip(id: 5);
      tripStore.upsert(trip);
      when(
        () => mockRepo.deleteTrip(any()),
      ).thenAnswer((_) async => const Right(null));

      // act
      await handler.deleteTrip(trip.id);

      // assert
      expect(tripStore.get(trip.id), isNull);
    });

    test('rollback si le repository retourne une Failure', () async {
      // arrange
      final trip = makeTrip(id: 5, title: 'À restaurer');
      tripStore.upsert(trip);
      when(
        () => mockRepo.deleteTrip(any()),
      ).thenAnswer((_) async => Left(ServerFailure('suppression échouée')));

      // act
      await handler.deleteTrip(trip.id);

      // assert — le trip est restauré dans le store
      expect(tripStore.get(trip.id), equals(trip));
    });

    test('lève une exception si l\'id n\'existe pas dans le store', () async {
      // assert
      expect(() => handler.deleteTrip(Id<Trip>(99)), throwsException);
    });
  });
}
