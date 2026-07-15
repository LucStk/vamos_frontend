import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:latlong2/latlong.dart';
import 'package:mocktail/mocktail.dart';
import 'package:domain_core/domain_core.dart';
import 'package:domain_core/optimitic_executor.dart';
import 'package:trip_application/trip_application.dart';

// ---------------------------------------------------------------------------
// Mocks
// ---------------------------------------------------------------------------

class MockWaypointRepository extends Mock implements WaypointRepository {}

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

Waypoint makeWaypoint({int id = 1, int vertexId = 10, String title = 'WP'}) =>
    Waypoint(
      id: Id<Waypoint>(id),
      vertexId: Id<Vertex>(vertexId),
      title: title,
    );

Vertex makeVertex({int id = 10}) =>
    Vertex(id: Id<Vertex>(id), latLng: const LatLng(48.85, 2.35));

void main() {
  late MockWaypointRepository mockRepo;
  late WaypointStore waypointStore;
  late GraphStore graphStore;
  late OptimisticExecutor executor;
  late WaypointHandler handler;

  final tripId = Id<Trip>(1);

  setUpAll(() {
    registerFallbackValue(makeWaypoint());
    registerFallbackValue(Id<Waypoint>(0));
    registerFallbackValue(Id<Vertex>(0));
    registerFallbackValue(const LatLng(0, 0));
  });

  setUp(() {
    mockRepo = MockWaypointRepository();
    waypointStore = WaypointStore();
    graphStore = GraphStore();
    executor = OptimisticExecutor();
    handler = WaypointHandler(
      tripId,
      waypointStore,
      graphStore,
      mockRepo,
      executor,
    );
  });

  // -------------------------------------------------------------------------
  // loadFromRemote
  // -------------------------------------------------------------------------

  group('WaypointHandler.loadFromRemote', () {
    test(
      'vide le store et charge les waypoints depuis le repository',
      () async {
        // arrange
        waypointStore.upsert(makeWaypoint(id: 99));
        final remoteWaypoints = [
          makeWaypoint(id: 1),
          makeWaypoint(id: 2, vertexId: 20),
        ];
        when(
          () => mockRepo.getWaypoints(tripId),
        ).thenAnswer((_) async => Right(remoteWaypoints));

        // act
        handler.loadFromRemote();
        await Future.microtask(() {});

        // assert
        expect(waypointStore.get(Id<Waypoint>(99)), isNull);
        expect(waypointStore.get(Id<Waypoint>(1)), equals(remoteWaypoints[0]));
        expect(waypointStore.get(Id<Waypoint>(2)), equals(remoteWaypoints[1]));
      },
    );

    test('le store reste vide si le repository retourne une Failure', () async {
      // arrange
      when(
        () => mockRepo.getWaypoints(tripId),
      ).thenAnswer((_) async => Left(ServerFailure('erreur')));

      // act — on capture l'exception asynchrone via un try/catch
      try {
        await Future(() => handler.loadFromRemote());
        // attendre que la Future interne se termine
        await Future.delayed(Duration.zero);
      } catch (_) {}

      // assert — en cas d'erreur le store n'est pas peuplé
      expect(waypointStore.store, isEmpty);
    });
  });

  // -------------------------------------------------------------------------
  // createBlankWaypoint
  // -------------------------------------------------------------------------

  group('WaypointHandler.createBlankWaypoint', () {
    test(
      'retourne le waypoint et ajoute vertex + waypoint dans les stores',
      () async {
        // arrange
        final wp = makeWaypoint(id: 5, vertexId: 50);
        final vertex = makeVertex(id: 50);
        when(
          () => mockRepo.createBlankWaypoint(tripId, any(), any()),
        ).thenAnswer((_) async => Right((wp, vertex)));

        // act
        final result = await handler.createBlankWaypoint(null, null);

        // assert
        expect(result, equals(wp));
        expect(waypointStore.get(wp.id), equals(wp));
        expect(graphStore.vertexStore.get(vertex.id), equals(vertex));
      },
    );

    test('lève une exception si le repository retourne une Failure', () async {
      // arrange
      when(
        () => mockRepo.createBlankWaypoint(tripId, any(), any()),
      ).thenAnswer((_) async => Left(ServerFailure('création échouée')));

      // assert
      await expectLater(
        handler.createBlankWaypoint(null, null),
        throwsException,
      );
    });
  });

  // -------------------------------------------------------------------------
  // updateWaypoint
  // -------------------------------------------------------------------------

  group('WaypointHandler.updateWaypoint', () {
    test(
      'met à jour le store optimistiquement puis avec la réponse serveur',
      () async {
        // arrange
        final original = makeWaypoint(id: 1, vertexId: 10, title: 'Original');
        final updated = makeWaypoint(id: 1, vertexId: 10, title: 'Modifié');
        final serverWp = makeWaypoint(id: 1, vertexId: 10, title: 'Serveur');
        waypointStore.upsert(original);
        when(
          () => mockRepo.updateWaypoint(any()),
        ).thenAnswer((_) async => Right(serverWp));

        // act
        await handler.updateWaypoint(updated);

        // assert — valeur finale = réponse serveur
        expect(waypointStore.get(Id<Waypoint>(1))!.title, equals('Serveur'));
      },
    );

    test(
      'rollback vers l\'ancienne valeur si le repository retourne une Failure',
      () async {
        // arrange
        final original = makeWaypoint(id: 1, vertexId: 10, title: 'Original');
        final updated = makeWaypoint(id: 1, vertexId: 10, title: 'Modifié');
        waypointStore.upsert(original);
        when(
          () => mockRepo.updateWaypoint(any()),
        ).thenAnswer((_) async => Left(ServerFailure('erreur')));

        // act
        await handler.updateWaypoint(updated);

        // assert — rollback
        expect(waypointStore.get(Id<Waypoint>(1))!.title, equals('Original'));
      },
    );

    test('lève une exception si le waypoint n\'existe pas dans le store', () {
      // arrange — store vide
      final wp = makeWaypoint(id: 42);

      // assert
      expect(() => handler.updateWaypoint(wp), throwsException);
    });
  });

  // -------------------------------------------------------------------------
  // deleteWaypoint
  // -------------------------------------------------------------------------

  group('WaypointHandler.deleteWaypoint', () {
    test('retire le waypoint du store de manière optimiste', () async {
      // arrange
      final wp = makeWaypoint(id: 3, vertexId: 30);
      waypointStore.upsert(wp);
      when(
        () => mockRepo.deleteWaypoint(any()),
      ).thenAnswer((_) async => const Right(null));

      // act
      await handler.deleteWaypoint(wp.id);

      // assert
      expect(waypointStore.get(wp.id), isNull);
    });

    test('rollback si le repository retourne une Failure', () async {
      // arrange
      final wp = makeWaypoint(id: 3, vertexId: 30, title: 'À restaurer');
      waypointStore.upsert(wp);
      when(
        () => mockRepo.deleteWaypoint(any()),
      ).thenAnswer((_) async => Left(ServerFailure('suppression échouée')));

      // act
      await handler.deleteWaypoint(wp.id);

      // assert — le waypoint est restauré
      expect(waypointStore.get(wp.id), equals(wp));
    });

    test('lève une exception si le waypoint n\'est pas dans le store', () {
      // assert
      expect(() => handler.deleteWaypoint(Id<Waypoint>(99)), throwsException);
    });
  });
}
