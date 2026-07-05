import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:latlong2/latlong.dart';
import 'package:mocktail/mocktail.dart';
import 'package:domain_core/domain_core.dart';
import 'package:domain_core/optimitic_executor.dart';
import 'package:trip_domain/trip_domain.dart';

// ---------------------------------------------------------------------------
// Mocks
// ---------------------------------------------------------------------------

class MockSegmentRepository extends Mock implements SegmentRepository {}

class MockVertexRepository extends Mock implements VertexRepository {}

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

Segment makeSegment({
  int id = 1,
  int startId = 10,
  int endId = 20,
  MobilityType mobilityType = MobilityType.bike,
}) => Segment(
  id: Id<Segment>(id),
  startVertexId: Id<Vertex>(startId),
  endVertexId: Id<Vertex>(endId),
  geometry: const [LatLng(48.85, 2.35), LatLng(48.86, 2.36)],
  mobilityType: mobilityType,
);

void main() {
  late MockSegmentRepository mockSegmentRepo;
  late MockVertexRepository mockVertexRepo;
  late GraphStore graphStore;
  late OptimisticExecutor executor;
  late TopologyHandler handler;

  final tripId = Id<Trip>(1);

  setUpAll(() {
    registerFallbackValue(makeSegment());
    registerFallbackValue(Id<Segment>(0));
    registerFallbackValue(Id<Trip>(0));
  });

  setUp(() {
    mockSegmentRepo = MockSegmentRepository();
    mockVertexRepo = MockVertexRepository();
    graphStore = GraphStore();
    executor = OptimisticExecutor();
    handler = TopologyHandler(
      tripId,
      graphStore,
      mockSegmentRepo,
      mockVertexRepo,
      executor,
    );
  });

  // -------------------------------------------------------------------------
  // updateSegment
  // -------------------------------------------------------------------------

  group('TopologyHandler.updateSegment', () {
    test(
      'met à jour le store optimistiquement puis avec la réponse serveur',
      () async {
        // arrange
        final original = makeSegment(id: 1, mobilityType: MobilityType.bike);
        final updated = makeSegment(id: 1, mobilityType: MobilityType.walk);
        final serverSegment = makeSegment(
          id: 1,
          mobilityType: MobilityType.car,
        );
        graphStore.insertSegment(original);
        when(
          () => mockSegmentRepo.updateSegment(any()),
        ).thenAnswer((_) async => Right(serverSegment));

        // act
        await handler.updateSegment(updated);

        // assert — valeur finale = réponse serveur
        expect(
          graphStore.segmentStore.get(Id<Segment>(1))!.mobilityType,
          equals(MobilityType.car),
        );
      },
    );

    test(
      'rollback vers l\'ancienne valeur si le repository retourne une Failure',
      () async {
        // arrange
        final original = makeSegment(id: 1, mobilityType: MobilityType.bike);
        final updated = makeSegment(id: 1, mobilityType: MobilityType.walk);
        graphStore.insertSegment(original);
        when(
          () => mockSegmentRepo.updateSegment(any()),
        ).thenAnswer((_) async => Left(ServerFailure('erreur serveur')));

        // act
        await handler.updateSegment(updated);

        // assert — rollback vers bike
        expect(
          graphStore.segmentStore.get(Id<Segment>(1))!.mobilityType,
          equals(MobilityType.bike),
        );
      },
    );

    test(
      'lève une exception si le segment n\'existe pas dans le graphStore',
      () async {
        // arrange — graphStore vide
        final segment = makeSegment(id: 42);

        // assert
        await expectLater(handler.updateSegment(segment), throwsException);
      },
    );
  });
}
